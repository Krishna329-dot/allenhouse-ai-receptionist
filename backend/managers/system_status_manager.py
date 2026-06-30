"""
System status manager for handling system health monitoring
"""

from backend.models.data_models import SystemStatus
from datetime import datetime


class SystemStatusManager:
    """Manages system status and health checks"""
    
    def __init__(self):
        """Initialize system status manager"""
        self._status = self._get_default_status()
    
    def _get_default_status(self) -> SystemStatus:
        """Get default system status"""
        return SystemStatus(
            microphone=True,
            speaker=True,
            network=True,
            llm_status="offline",  # LLM not implemented yet
            database=True,
            camera=True,
            power=True
        )
    
    def get_status(self) -> SystemStatus:
        """Get current system status"""
        return self._status
    
    def update_status(self, **kwargs):
        """Update system status"""
        for key, value in kwargs.items():
            if hasattr(self._status, key):
                setattr(self._status, key, value)
    
    def set_microphone_status(self, status: bool):
        """Update microphone status"""
        self._status.microphone = status
    
    def set_speaker_status(self, status: bool):
        """Update speaker status"""
        self._status.speaker = status
    
    def set_network_status(self, status: bool):
        """Update network status"""
        self._status.network = status
    
    def set_llm_status(self, status: str):
        """Update LLM status (offline, loading, online)"""
        self._status.llm_status = status
    
    def all_systems_operational(self) -> bool:
        """Check if all systems are operational"""
        return (
            self._status.microphone and
            self._status.speaker and
            self._status.network and
            self._status.database
        )
