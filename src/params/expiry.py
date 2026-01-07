"""Expiration time parameter presets."""

from src.types import Time, ExpiryParams


# Standard expiries in years
ONE_WEEK = Time(7/365)
TWO_WEEKS = Time(14/365)
ONE_MONTH = Time(30/365)
TWO_MONTHS = Time(60/365)
THREE_MONTHS = Time(90/365)
SIX_MONTHS = Time(180/365)
ONE_YEAR = Time(365/365)

STANDARD_MATURITIES: tuple[Time, ...] = (
    ONE_WEEK,
    TWO_WEEKS,
    ONE_MONTH,
    TWO_MONTHS,
    THREE_MONTHS,
    SIX_MONTHS,
    ONE_YEAR,
)

SHORT_TERM_MATURITIES: tuple[Time, ...] = (
    ONE_WEEK,
    TWO_WEEKS,
    ONE_MONTH,
)

LONG_TERM_MATURITIES: tuple[Time, ...] = (
    THREE_MONTHS,
    SIX_MONTHS,
    ONE_YEAR,
)


def make_expiry(
    maturities: tuple[Time, ...] = STANDARD_MATURITIES,
    n_samples: int = 20
) -> ExpiryParams:
    """Factory for ExpiryParams."""
    return ExpiryParams(
        standard_expiries=maturities,
        n_samples=n_samples
    )


# Presets
DEFAULT = make_expiry()
SHORT_TERM = make_expiry(SHORT_TERM_MATURITIES, n_samples=10)
LONG_TERM = make_expiry(LONG_TERM_MATURITIES, n_samples=10)
