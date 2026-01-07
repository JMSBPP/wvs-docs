"""Simulation functions for options order book generation."""

import numpy as np
from scipy.stats import norm

from src.types import (
    Price, Volatility, Time, Rate, Quantity,
    OptionType, OrderSide,
    MarketParams, BrownianParams, PoissonOrderParams, ExpiryParams,
    Order, OptionContract, OptionOrder, VolatilityForecast, SimulationResult
)
from src.params import (
    DEFAULT_BROWNIAN, DEFAULT_POISSON, DEFAULT_EXPIRY,
    DEFAULT_RISK_FREE_RATE, DEFAULT_BASE_VOL, DEFAULT_VOL_OF_VOL,
    DEFAULT_SPREAD_PCT, DEFAULT_INITIAL_SPOT,
    DEFAULT_N_STRIKES, DEFAULT_STRIKE_RANGE, DEFAULT_ORDERS_PER_EXPIRY
)


# =============================================================================
# 1. BROWNIAN MOTION
# =============================================================================

def generate_price_path(
    s0: Price,
    params: BrownianParams,
    rng: np.random.Generator
) -> tuple[np.ndarray, np.ndarray]:
    """Generate GBM price path. Returns (times, prices)."""
    dt = float(params.dt)
    n = params.n_steps

    z = rng.standard_normal(n)
    drift = (params.mu - 0.5 * params.sigma ** 2) * dt
    diffusion = params.sigma * np.sqrt(dt) * z

    log_prices = np.zeros(n + 1)
    log_prices[0] = np.log(float(s0))
    log_prices[1:] = log_prices[0] + np.cumsum(drift + diffusion)

    return np.linspace(0, n * dt, n + 1), np.exp(log_prices)


# =============================================================================
# 2. POISSON ORDER ARRIVALS
# =============================================================================

def generate_arrivals(
    params: PoissonOrderParams,
    rng: np.random.Generator
) -> np.ndarray:
    """Generate Poisson arrival times."""
    arrivals = []
    t = 0.0
    horizon = float(params.time_horizon)

    while t < horizon:
        t += rng.exponential(1.0 / params.lambda_rate)
        if t < horizon:
            arrivals.append(t)

    return np.array(arrivals)


def generate_order_book(
    arrivals: np.ndarray,
    spot: Price,
    spread_pct: float,
    rng: np.random.Generator
) -> list[Order]:
    """Generate orders from arrival times."""
    orders = []
    for t in arrivals:
        side = OrderSide.BID if rng.random() < 0.5 else OrderSide.ASK
        offset = rng.uniform(0, spread_pct) * float(spot)
        price = Price(float(spot) + (-offset if side == OrderSide.BID else offset))
        quantity = Quantity(int(rng.integers(1, 100)))
        orders.append(Order(Time(t), price, quantity, side))
    return orders


# =============================================================================
# 3. EXPIRATION TIMES
# =============================================================================

def generate_expirations(
    params: ExpiryParams,
    rng: np.random.Generator
) -> np.ndarray:
    """Generate unique sorted expiration times."""
    indices = rng.choice(len(params.standard_expiries), size=params.n_samples)
    expiries = np.array([float(params.standard_expiries[i]) for i in indices])
    return np.sort(np.unique(expiries))


# =============================================================================
# 4. VOLATILITY FORECAST
# =============================================================================

def generate_vol_forecast(
    base_vol: Volatility,
    vol_of_vol: float,
    rng: np.random.Generator
) -> VolatilityForecast:
    """Generate market IV and trader forecast."""
    market_iv = Volatility(max(0.01, float(base_vol) + rng.normal(0, vol_of_vol)))
    trader_vol = Volatility(max(0.01, float(base_vol) + rng.normal(0, vol_of_vol * 0.5)))
    return VolatilityForecast(market_iv, trader_vol)


# =============================================================================
# 5. BLACK-SCHOLES PRICING
# =============================================================================

def bs_call(s: Price, k: Price, t: Time, sigma: Volatility, r: Rate) -> Price:
    """Black-Scholes call price."""
    if float(t) <= 0:
        return Price(max(0, float(s) - float(k)))
    d1 = (np.log(float(s)/float(k)) + (float(r) + 0.5*float(sigma)**2)*float(t)) / (float(sigma)*np.sqrt(float(t)))
    d2 = d1 - float(sigma) * np.sqrt(float(t))
    return Price(float(s) * norm.cdf(d1) - float(k) * np.exp(-float(r)*float(t)) * norm.cdf(d2))


def bs_put(s: Price, k: Price, t: Time, sigma: Volatility, r: Rate) -> Price:
    """Black-Scholes put price."""
    if float(t) <= 0:
        return Price(max(0, float(k) - float(s)))
    d1 = (np.log(float(s)/float(k)) + (float(r) + 0.5*float(sigma)**2)*float(t)) / (float(sigma)*np.sqrt(float(t)))
    d2 = d1 - float(sigma) * np.sqrt(float(t))
    return Price(float(k) * np.exp(-float(r)*float(t)) * norm.cdf(-d2) - float(s) * norm.cdf(-d1))


def price_option(contract: OptionContract, market: MarketParams) -> Price:
    """Price an option using Black-Scholes."""
    pricer = bs_call if contract.option_type == OptionType.CALL else bs_put
    return pricer(market.spot, contract.strike, contract.expiry, market.implied_vol, market.risk_free_rate)


# =============================================================================
# 6. OPTIONS ORDER BOOK
# =============================================================================

def generate_strikes(spot: Price, n: int, range_pct: float) -> list[Price]:
    """Generate strike grid around spot."""
    low, high = float(spot) * (1 - range_pct), float(spot) * (1 + range_pct)
    return [Price(k) for k in np.linspace(low, high, n)]


def generate_options_book(
    underlying_orders: list[Order],
    expirations: np.ndarray,
    market: MarketParams,
    n_strikes: int,
    strike_range: float,
    orders_per_expiry: int,
    rng: np.random.Generator
) -> list[OptionOrder]:
    """Generate options order book from underlying orders."""
    strikes = generate_strikes(market.spot, n_strikes, strike_range)
    option_orders = []

    for expiry in expirations:
        n_select = min(orders_per_expiry, len(underlying_orders))
        indices = rng.choice(len(underlying_orders), size=n_select, replace=False)

        for i in indices:
            order = underlying_orders[i]
            opt_type = (OptionType.CALL if rng.random() < 0.6 else OptionType.PUT) \
                if order.side == OrderSide.ASK else \
                (OptionType.PUT if rng.random() < 0.6 else OptionType.CALL)

            contract = OptionContract(rng.choice(strikes), Time(expiry), opt_type)
            option_orders.append(OptionOrder(
                contract, price_option(contract, market),
                order.quantity, order.side, order.arrival_time
            ))

    return option_orders


# =============================================================================
# 7. FULL SIMULATION
# =============================================================================

def run_simulation(
    seed: int | None = None,
    initial_spot: Price = DEFAULT_INITIAL_SPOT,
    brownian: BrownianParams = DEFAULT_BROWNIAN,
    poisson: PoissonOrderParams = DEFAULT_POISSON,
    expiry_params: ExpiryParams = DEFAULT_EXPIRY,
    risk_free_rate: Rate = DEFAULT_RISK_FREE_RATE,
    base_vol: Volatility = DEFAULT_BASE_VOL,
    vol_of_vol: float = DEFAULT_VOL_OF_VOL,
    spread_pct: float = DEFAULT_SPREAD_PCT,
    n_strikes: int = DEFAULT_N_STRIKES,
    strike_range: float = DEFAULT_STRIKE_RANGE,
    orders_per_expiry: int = DEFAULT_ORDERS_PER_EXPIRY
) -> SimulationResult:
    """Run complete simulation with all components."""
    rng = np.random.default_rng(seed)

    # 1. Price path
    times, prices = generate_price_path(initial_spot, brownian, rng)
    spot = Price(prices[-1])

    # 2. Order book
    arrivals = generate_arrivals(poisson, rng)
    underlying = generate_order_book(arrivals, spot, spread_pct, rng)

    # 3. Expirations
    expirations = generate_expirations(expiry_params, rng)

    # 4. Volatility forecast
    vol_forecast = generate_vol_forecast(base_vol, vol_of_vol, rng)

    # 5. Market params
    market = MarketParams(spot, risk_free_rate, vol_forecast.market_iv, vol_forecast.trader_forecast)

    # 6. Options book
    options = generate_options_book(underlying, expirations, market, n_strikes, strike_range, orders_per_expiry, rng)

    return SimulationResult(times, prices, underlying, options, expirations, vol_forecast, market)
