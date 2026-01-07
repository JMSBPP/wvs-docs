"""Brownian motion parameter presets."""

from src.types import Time, Volatility, BrownianParams


DAILY_STEP = Time(1/252)
HOURLY_STEP = Time(1/(252*6.5))  # 6.5 trading hours


def make_brownian(
    mu: float = 0.05,
    sigma: float = 0.2,
    dt: Time = DAILY_STEP,
    n_steps: int = 252
) -> BrownianParams:
    """Factory for BrownianParams with sensible defaults."""
    return BrownianParams(
        mu=mu,
        sigma=Volatility(sigma),
        dt=dt,
        n_steps=n_steps
    )


# Presets
CONSERVATIVE = make_brownian(mu=0.03, sigma=0.15)
MODERATE = make_brownian(mu=0.05, sigma=0.20)
AGGRESSIVE = make_brownian(mu=0.08, sigma=0.30)
HIGH_VOL = make_brownian(mu=0.05, sigma=0.40)
