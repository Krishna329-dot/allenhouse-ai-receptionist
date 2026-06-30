"""
Quote manager for handling quotes data
"""

from typing import List, Optional
from backend.models.data_models import Quote
import random


class QuoteManager:
    """Manages quotes data and operations"""
    
    def __init__(self):
        """Initialize quote manager with dummy data"""
        self._quotes = self._initialize_dummy_quotes()
    
    def _initialize_dummy_quotes(self) -> List[Quote]:
        """Initialize with inspirational quotes"""
        return [
            Quote(
                text="The future depends on what you do today.",
                author="Mahatma Gandhi"
            ),
            Quote(
                text="Education is the most powerful weapon which you can use to change the world.",
                author="Nelson Mandela"
            ),
            Quote(
                text="Success is not final, failure is not fatal: it is the courage to continue that counts.",
                author="Winston Churchill"
            ),
            Quote(
                text="The only way to do great work is to love what you do.",
                author="Steve Jobs"
            ),
            Quote(
                text="Believe you can and you're halfway there.",
                author="Theodore Roosevelt"
            ),
            Quote(
                text="Innovation distinguishes between a leader and a follower.",
                author="Steve Jobs"
            ),
            Quote(
                text="Don't watch the clock; do what it does. Keep going.",
                author="Sam Levenson"
            ),
            Quote(
                text="The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.",
                author="Brian Herbert"
            ),
            Quote(
                text="Excellence is not a destination; it is a continuous journey that never ends.",
                author="Brian Tracy"
            ),
            Quote(
                text="Your education is a dress rehearsal for a life that is yours to lead.",
                author="Nora Ephron"
            )
        ]
    
    def get_all_quotes(self) -> List[Quote]:
        """Get all quotes"""
        return self._quotes
    
    def get_random_quote(self) -> Quote:
        """Get a random quote"""
        return random.choice(self._quotes)
    
    def get_quote_by_index(self, index: int) -> Optional[Quote]:
        """Get quote by index"""
        if 0 <= index < len(self._quotes):
            return self._quotes[index]
        return None
