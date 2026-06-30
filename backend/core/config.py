"""
Configuration management for Allenhouse AI Receptionist
Centralized configuration handling for theme, colors, and constants
"""

from dataclasses import dataclass
from typing import Dict
from pathlib import Path


@dataclass
class ColorScheme:
    """Color palette for the application"""
    # Primary Colors
    primary_blue: str = "#003DA5"
    primary_dark_blue: str = "#001F5C"
    primary_light_blue: str = "#0052CC"
    
    # Accent Colors
    golden_accent: str = "#F4B860"
    golden_light: str = "#FFD699"
    
    # Background Colors
    white_bg: str = "#FFFFFF"
    light_gray: str = "#F5F5F5"
    gray_bg: str = "#EEEEEE"
    
    # Text Colors
    dark_text: str = "#1A1A1A"
    medium_text: str = "#444444"
    light_text: str = "#888888"
    
    # Status Colors
    success_green: str = "#4CAF50"
    error_red: str = "#F44336"
    warning_orange: str = "#FF9800"
    info_blue: str = "#2196F3"
    
    # Utility Colors
    border_light: str = "#E0E0E0"
    shadow_color: str = "#00000015"
    hover_overlay: str = "#00000008"


@dataclass
class AppConfig:
    """Application configuration"""
    # Window
    window_width: int = 1920
    window_height: int = 1080
    window_title: str = "Allenhouse AI Receptionist"
    
    # Display
    fps_target: int = 60
    animation_duration: int = 300  # ms
    
    # Paths
    assets_path: str = "ui/assets"
    qml_path: str = "ui/qml"
    
    # Features
    enable_animations: bool = True
    enable_voice: bool = True
    enable_map_zoom: bool = True
    
    # Timeouts (ms)
    request_timeout: int = 5000
    animation_timeout: int = 300
    
    # Responsive Breakpoints
    breakpoints: Dict[str, int] = None
    
    def __post_init__(self):
        if self.breakpoints is None:
            self.breakpoints = {
                "desktop_large": 1920,
                "desktop": 1600,
                "desktop_small": 1366
            }


class Config:
    """Centralized configuration management"""
    
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._initialize()
        return cls._instance
    
    def _initialize(self):
        """Initialize configuration"""
        self.colors = ColorScheme()
        self.app = AppConfig()
        self.project_root = Path(__file__).parent.parent.parent
    
    @property
    def assets_dir(self) -> Path:
        """Get assets directory path"""
        return self.project_root / self.app.assets_path
    
    @property
    def qml_dir(self) -> Path:
        """Get QML directory path"""
        return self.project_root / self.app.qml_path
    
    def to_dict(self) -> Dict:
        """Convert config to dictionary"""
        return {
            "colors": vars(self.colors),
            "app": vars(self.app),
            "paths": {
                "assets": str(self.assets_dir),
                "qml": str(self.qml_dir)
            }
        }


# Global config instance
config = Config()
