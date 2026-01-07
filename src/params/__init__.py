"""Fixed simulation parameters as module-level constants."""

from src.types import (
    Time, Volatility, Rate, Price,
    BrownianParams, PoissonOrderParams, ExpiryParams
)

# Brownian motion defaults
DEFAULT_BROWNIAN = BrownianParams(
    mu=0.05,
    sigma=Volatility(0.2),
    dt=Time(1/252),
    n_steps=252
)

# Order arrival defaults
DEFAULT_POISSON = PoissonOrderParams(
    lambda_rate=10.0,
    time_horizon=Time(1.0)
)

# Standard expiration times
STANDARD_EXPIRIES: tuple[Time, ...] = (
    Time(7/365),    # 1 week
    Time(14/365),   # 2 weeks
    Time(30/365),   # 1 month
    Time(60/365),   # 2 months
    Time(90/365),   # 3 months
    Time(180/365),  # 6 months
    Time(365/365),  # 1 year
)

DEFAULT_EXPIRY = ExpiryParams(
    standard_expiries=STANDARD_EXPIRIES,
    n_samples=20
)

# Market defaults
DEFAULT_RISK_FREE_RATE = Rate(0.05)
DEFAULT_BASE_VOL = Volatility(0.20)
DEFAULT_VOL_OF_VOL = 0.05
DEFAULT_SPREAD_PCT = 0.02
DEFAULT_INITIAL_SPOT = Price(100.0)

# Option grid defaults
DEFAULT_N_STRIKES = 11
DEFAULT_STRIKE_RANGE = 0.15
DEFAULT_ORDERS_PER_EXPIRY = 5
