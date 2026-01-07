"""Options order book simulation package."""

from src.types import (
    Price, Volatility, Time, Rate, Quantity,
    OptionType, OrderSide,
    MarketParams, BrownianParams, PoissonOrderParams, ExpiryParams,
    Order, OptionContract, OptionOrder, VolatilityForecast, SimulationResult
)

from src.simulation import run_simulation

from src.typeAdapters import (
    result_to_summary,
    result_to_price_path,
    orders_to_scatter,
    options_to_scatter,
    orders_to_records,
    options_to_records,
    SimulationSummary
)

__all__ = [
    # Types
    'Price', 'Volatility', 'Time', 'Rate', 'Quantity',
    'OptionType', 'OrderSide',
    'MarketParams', 'BrownianParams', 'PoissonOrderParams', 'ExpiryParams',
    'Order', 'OptionContract', 'OptionOrder', 'VolatilityForecast', 'SimulationResult',
    # Simulation
    'run_simulation',
    # Adapters
    'result_to_summary', 'result_to_price_path',
    'orders_to_scatter', 'options_to_scatter',
    'orders_to_records', 'options_to_records',
    'SimulationSummary'
]
