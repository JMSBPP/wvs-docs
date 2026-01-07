"""Type adapters for converting domain types to visualization library formats.

Adapters convert our strongly-typed domain objects to the primitive types
that visualization libraries (matplotlib, plotly, pandas) expect.
"""

from dataclasses import dataclass
from typing import TypeVar, Callable, Generic
import numpy as np

from src.types import (
    Price, Volatility, Time, Rate, Quantity,
    Order, OptionOrder, OptionContract, OptionType, OrderSide,
    SimulationResult, VolatilityForecast
)


# =============================================================================
# GENERIC ADAPTER PROTOCOL
# =============================================================================

T = TypeVar('T')
U = TypeVar('U')


@dataclass(frozen=True)
class Adapter(Generic[T, U]):
    """Generic adapter from type T to type U."""
    adapt: Callable[[T], U]

    def __call__(self, value: T) -> U:
        return self.adapt(value)

    def map(self, values: list[T]) -> list[U]:
        return [self.adapt(v) for v in values]


# =============================================================================
# PRIMITIVE ADAPTERS
# =============================================================================

price_to_float: Adapter[Price, float] = Adapter(lambda p: float(p))
vol_to_float: Adapter[Volatility, float] = Adapter(lambda v: float(v))
time_to_float: Adapter[Time, float] = Adapter(lambda t: float(t))
rate_to_float: Adapter[Rate, float] = Adapter(lambda r: float(r))
quantity_to_int: Adapter[Quantity, int] = Adapter(lambda q: int(q))

time_to_days: Adapter[Time, float] = Adapter(lambda t: float(t) * 365)
vol_to_pct: Adapter[Volatility, float] = Adapter(lambda v: float(v) * 100)


# =============================================================================
# ORDER ADAPTERS (for tabular display)
# =============================================================================

@dataclass(frozen=True)
class OrderRow:
    """Flat representation of Order for tabular display."""
    arrival_time: float
    price: float
    quantity: int
    side: str


@dataclass(frozen=True)
class OptionOrderRow:
    """Flat representation of OptionOrder for tabular display."""
    arrival_time: float
    strike: float
    expiry_days: float
    option_type: str
    bs_price: float
    quantity: int
    side: str


def order_to_row(order: Order) -> OrderRow:
    """Convert Order to flat row."""
    return OrderRow(
        arrival_time=float(order.arrival_time),
        price=float(order.price),
        quantity=int(order.quantity),
        side=order.side.value
    )


def option_order_to_row(opt: OptionOrder) -> OptionOrderRow:
    """Convert OptionOrder to flat row."""
    return OptionOrderRow(
        arrival_time=float(opt.arrival_time),
        strike=float(opt.contract.strike),
        expiry_days=float(opt.contract.expiry) * 365,
        option_type=opt.contract.option_type.value,
        bs_price=float(opt.price),
        quantity=int(opt.quantity),
        side=opt.side.value
    )


order_adapter: Adapter[Order, OrderRow] = Adapter(order_to_row)
option_adapter: Adapter[OptionOrder, OptionOrderRow] = Adapter(option_order_to_row)


# =============================================================================
# MATPLOTLIB ADAPTERS
# =============================================================================

@dataclass(frozen=True)
class PricePathData:
    """Data for plotting price path."""
    times: np.ndarray
    prices: np.ndarray


@dataclass(frozen=True)
class OrderBookScatter:
    """Data for scatter plot of order book."""
    times: np.ndarray
    prices: np.ndarray
    sizes: np.ndarray
    colors: list[str]


@dataclass(frozen=True)
class OptionsHeatmapData:
    """Data for options heatmap (strike x expiry)."""
    strikes: np.ndarray
    expiries: np.ndarray
    prices: np.ndarray  # 2D array
    types: np.ndarray   # 2D array of 'call'/'put'


def result_to_price_path(result: SimulationResult) -> PricePathData:
    """Extract price path data for plotting."""
    return PricePathData(
        times=result.price_times,
        prices=result.price_path
    )


def orders_to_scatter(orders: list[Order]) -> OrderBookScatter:
    """Convert orders to scatter plot data."""
    return OrderBookScatter(
        times=np.array([float(o.arrival_time) for o in orders]),
        prices=np.array([float(o.price) for o in orders]),
        sizes=np.array([int(o.quantity) for o in orders]),
        colors=['green' if o.side == OrderSide.BID else 'red' for o in orders]
    )


def options_to_scatter(options: list[OptionOrder], spot: float) -> OrderBookScatter:
    """Convert option orders to scatter plot data."""
    return OrderBookScatter(
        times=np.array([float(o.contract.expiry) * 365 for o in options]),  # days to expiry
        prices=np.array([float(o.contract.strike) for o in options]),       # strike
        sizes=np.array([float(o.price) * 10 + 5 for o in options]),         # BS price as size
        colors=['blue' if o.contract.option_type == OptionType.CALL else 'orange' for o in options]
    )


# =============================================================================
# SUMMARY STATISTICS ADAPTER
# =============================================================================

@dataclass(frozen=True)
class SimulationSummary:
    """Summary statistics for visualization."""
    # Price path
    initial_price: float
    final_price: float
    min_price: float
    max_price: float
    price_return: float

    # Orders
    n_underlying_orders: int
    n_bids: int
    n_asks: int

    # Options
    n_option_orders: int
    n_calls: int
    n_puts: int
    n_expiries: int
    n_strikes: int
    avg_bs_price: float

    # Volatility
    market_iv_pct: float
    trader_vol_pct: float
    vol_spread_pct: float


def result_to_summary(result: SimulationResult) -> SimulationSummary:
    """Extract summary statistics from simulation result."""
    prices = result.price_path
    underlying = result.underlying_orders
    options = result.option_orders

    return SimulationSummary(
        initial_price=prices[0],
        final_price=prices[-1],
        min_price=prices.min(),
        max_price=prices.max(),
        price_return=(prices[-1] / prices[0] - 1) * 100,

        n_underlying_orders=len(underlying),
        n_bids=sum(1 for o in underlying if o.side == OrderSide.BID),
        n_asks=sum(1 for o in underlying if o.side == OrderSide.ASK),

        n_option_orders=len(options),
        n_calls=sum(1 for o in options if o.contract.option_type == OptionType.CALL),
        n_puts=sum(1 for o in options if o.contract.option_type == OptionType.PUT),
        n_expiries=len(result.expiration_times),
        n_strikes=len(set(float(o.contract.strike) for o in options)),
        avg_bs_price=np.mean([float(o.price) for o in options]) if options else 0,

        market_iv_pct=float(result.volatility_forecast.market_iv) * 100,
        trader_vol_pct=float(result.volatility_forecast.trader_forecast) * 100,
        vol_spread_pct=result.volatility_forecast.vol_spread * 100
    )


# =============================================================================
# PANDAS ADAPTERS (optional, if pandas available)
# =============================================================================

def orders_to_records(orders: list[Order]) -> list[dict]:
    """Convert orders to list of dicts (for pd.DataFrame)."""
    return [
        {
            'arrival_time': float(o.arrival_time),
            'price': float(o.price),
            'quantity': int(o.quantity),
            'side': o.side.value
        }
        for o in orders
    ]


def options_to_records(options: list[OptionOrder]) -> list[dict]:
    """Convert option orders to list of dicts (for pd.DataFrame)."""
    return [
        {
            'arrival_time': float(o.arrival_time),
            'strike': float(o.contract.strike),
            'expiry_days': float(o.contract.expiry) * 365,
            'option_type': o.contract.option_type.value,
            'bs_price': float(o.price),
            'quantity': int(o.quantity),
            'side': o.side.value
        }
        for o in options
    ]
