"""
Weather manager for handling weather data
"""

from backend.models.data_models import WeatherData
from datetime import datetime


class WeatherManager:
    """Manages weather data (dummy/static)"""
    
    def __init__(self):
        """Initialize weather manager"""
        self._weather = self._get_dummy_weather()
    
    def _get_dummy_weather(self) -> WeatherData:
        """Get dummy weather data"""
        return WeatherData(
            temperature=32,
            condition="Partly Cloudy",
            humidity=65,
            wind_speed=12,
            city="Lucknow",
            country="UP"
        )
    
    def get_weather(self) -> WeatherData:
        """Get current weather"""
        return self._weather
    
    def update_weather(self, temperature: int, condition: str, humidity: int = 65, wind_speed: int = 12):
        """Update weather data (for testing)"""
        self._weather.temperature = temperature
        self._weather.condition = condition
        self._weather.humidity = humidity
        self._weather.wind_speed = wind_speed
