"""
Main application controller implementing MVVM pattern
Handles state management and communication between UI and backend
"""

from PySide6.QtCore import QObject, Signal, Slot, QTimer, QDateTime
from typing import Optional
import json
from datetime import datetime


class AppController(QObject):
    """Main application controller"""
    
    # Signals for UI updates
    current_time_changed = Signal(str)
    current_date_changed = Signal(str)
    theme_changed = Signal(str)
    page_changed = Signal(str)
    notification_received = Signal(str, str)  # title, message
    voice_state_changed = Signal(str)  # listening, speaking, idle, typing
    
    def __init__(self):
        super().__init__()
        
        # State
        self._current_page = "home"
        self._theme = "light"
        self._is_listening = False
        self._notification_count = 0
        self._language = "en"
        
        # Timer for clock updates
        self._timer = QTimer()
        self._timer.timeout.connect(self._update_time)
        self._timer.start(1000)  # Update every second
        
        # Initial update
        self._update_time()
    
    @Slot()
    def _update_time(self):
        """Update current time and date"""
        now = QDateTime.currentDateTime()
        time_str = now.toString("hh:mm AP")
        date_str = now.toString("dddd, d MMMM yyyy")
        
        self.current_time_changed.emit(time_str)
        self.current_date_changed.emit(date_str)
    
    @Slot(str)
    def navigate_to_page(self, page_name: str):
        """Navigate to a specific page"""
        if page_name != self._current_page:
            self._current_page = page_name
            self.page_changed.emit(page_name)
    
    @Slot(str)
    def set_theme(self, theme: str):
        """Change application theme"""
        valid_themes = ["light", "dark"]
        if theme in valid_themes and theme != self._theme:
            self._theme = theme
            self.theme_changed.emit(theme)
    
    @Slot(str)
    def set_language(self, language: str):
        """Change application language"""
        valid_languages = ["en", "hi"]
        if language in valid_languages:
            self._language = language
    
    @Slot()
    def start_listening(self):
        """Start voice listening (placeholder)"""
        self._is_listening = True
        self.voice_state_changed.emit("listening")
    
    @Slot()
    def stop_listening(self):
        """Stop voice listening (placeholder)"""
        self._is_listening = False
        self.voice_state_changed.emit("idle")
    
    @Slot(str, str)
    def show_notification(self, title: str, message: str):
        """Show a notification"""
        self._notification_count += 1
        self.notification_received.emit(title, message)
    
    @property
    def current_page(self) -> str:
        return self._current_page
    
    @property
    def theme(self) -> str:
        return self._theme
    
    @property
    def language(self) -> str:
        return self._language
    
    @property
    def is_listening(self) -> bool:
        return self._is_listening
    
    @property
    def notification_count(self) -> int:
        return self._notification_count
