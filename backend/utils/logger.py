"""
Logger utility for application logging
"""

import logging
from pathlib import Path
from datetime import datetime


class Logger:
    """Application logger"""
    
    _instance = None
    _logger = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._initialize()
        return cls._instance
    
    def _initialize(self):
        """Initialize logger"""
        # Create logs directory if it doesn't exist
        logs_dir = Path(__file__).parent.parent.parent / "logs"
        logs_dir.mkdir(exist_ok=True)
        
        # Configure logger
        self._logger = logging.getLogger("AllenouseAI")
        self._logger.setLevel(logging.DEBUG)
        
        # Create file handler
        log_file = logs_dir / f"app_{datetime.now().strftime('%Y%m%d')}.log"
        fh = logging.FileHandler(log_file)
        fh.setLevel(logging.DEBUG)
        
        # Create console handler
        ch = logging.StreamHandler()
        ch.setLevel(logging.INFO)
        
        # Create formatter
        formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        )
        fh.setFormatter(formatter)
        ch.setFormatter(formatter)
        
        # Add handlers to logger
        if not self._logger.handlers:
            self._logger.addHandler(fh)
            self._logger.addHandler(ch)
    
    @staticmethod
    def info(message: str):
        """Log info message"""
        Logger()._logger.info(message)
    
    @staticmethod
    def debug(message: str):
        """Log debug message"""
        Logger()._logger.debug(message)
    
    @staticmethod
    def warning(message: str):
        """Log warning message"""
        Logger()._logger.warning(message)
    
    @staticmethod
    def error(message: str, exception: Exception = None):
        """Log error message"""
        if exception:
            Logger()._logger.error(message, exc_info=exception)
        else:
            Logger()._logger.error(message)
    
    @staticmethod
    def critical(message: str):
        """Log critical message"""
        Logger()._logger.critical(message)
