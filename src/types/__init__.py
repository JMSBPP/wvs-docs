"""Domain types for options order book simulation."""

from dataclasses import dataclass
from typing import NewType
from enum import Enum


# Primitive type wrappers
Price = NewType('Price', float)
Volatility = NewType('Volatility', float)
Time = NewType('Time', float)
Rate = NewType('Rate', float)
Quantity = NewType('Quantity', int)


class OptionType(Enum):
    CALL = "call"
    PUT = "put"


class OrderSide(Enum):
    BID = "bid"
    ASK = "ask"


@dataclass(frozen=True)
class MarketParams:
    """Immutable market parameters."""
    spot: Price
    risk_free_rate: Rate
    implied_vol: Volatility
    trader_vol: Volatility


@dataclass(frozen=True)
class BrownianParams:
    """Parameters for geometric Brownian motion."""
    mu: float
    sigma: Volatility
    dt: Time
    n_steps: int


@dataclass(frozen=True)
class PoissonOrderParams:
    """Parameters for Poisson order arrival process."""
    lambda_rate: float
    time_horizon: Time


@dataclass(frozen=True)
class ExpiryParams:
    """Parameters for expiration time generation."""
    standard_expiries: tuple[Time, ...]
    n_samples: int


@dataclass(frozen=True)
class Order:
    """Represents an order in the underlying order book."""
    arrival_time: Time
    price: Price
    quantity: Quantity
    side: OrderSide


@dataclass(frozen=True)
class OptionContract:
    """Represents an option contract."""
    strike: Price
    expiry: Time
    option_type: OptionType


@dataclass(frozen=True)
class OptionOrder:
    """An order for an option contract."""
    contract: OptionContract
    price: Price
    quantity: Quantity
    side: OrderSide
    arrival_time: Time


@dataclass(frozen=True)
class VolatilityForecast:
    """Volatility forecasts - market vs trader."""
    market_iv: Volatility
    trader_forecast: Volatility

    @property
    def vol_spread(self) -> float:
        return float(self.trader_forecast) - float(self.market_iv)


@dataclass
class SimulationResult:
    """Results from a full simulation."""
    price_times: 'np.ndarray'
    price_path: 'np.ndarray'
    underlying_orders: list[Order]
    option_orders: list[OptionOrder]
    expiration_times: 'np.ndarray'
    volatility_forecast: VolatilityForecast
    market: MarketParams


# For type hints without importing numpy at module level
import numpy as np
