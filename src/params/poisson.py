"""Poisson process parameter presets."""

from src.types import Time, PoissonOrderParams


def make_poisson(
    lambda_rate: float = 10.0,
    time_horizon: float = 1.0
) -> PoissonOrderParams:
    """Factory for PoissonOrderParams."""
    return PoissonOrderParams(
        lambda_rate=lambda_rate,
        time_horizon=Time(time_horizon)
    )


# Presets
LOW_ACTIVITY = make_poisson(lambda_rate=5.0)
MODERATE_ACTIVITY = make_poisson(lambda_rate=10.0)
HIGH_ACTIVITY = make_poisson(lambda_rate=25.0)
VERY_HIGH_ACTIVITY = make_poisson(lambda_rate=50.0)
