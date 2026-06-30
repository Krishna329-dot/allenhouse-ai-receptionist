"""
Common utility functions
"""

from datetime import datetime
from typing import Any, Dict
import json


def get_current_time() -> str:
    """Get current time in HH:MM AM/PM format"""
    return datetime.now().strftime("%I:%M %p")


def get_current_date() -> str:
    """Get current date in formatted string"""
    return datetime.now().strftime("%A, %d %B %Y")


def get_current_datetime() -> str:
    """Get current date and time"""
    return datetime.now().isoformat()


def format_time(time_str: str, format_in: str = "%H:%M", format_out: str = "%I:%M %p") -> str:
    """Convert time format"""
    try:
        time_obj = datetime.strptime(time_str, format_in)
        return time_obj.strftime(format_out)
    except ValueError:
        return time_str


def format_date(date_str: str, format_in: str = "%Y-%m-%d", format_out: str = "%d %B %Y") -> str:
    """Convert date format"""
    try:
        date_obj = datetime.strptime(date_str, format_in)
        return date_obj.strftime(format_out)
    except ValueError:
        return date_str


def dict_to_json(data: Dict[str, Any]) -> str:
    """Convert dictionary to JSON string"""
    return json.dumps(data, indent=2, default=str)


def json_to_dict(json_str: str) -> Dict[str, Any]:
    """Convert JSON string to dictionary"""
    try:
        return json.loads(json_str)
    except json.JSONDecodeError:
        return {}


def truncate_string(text: str, max_length: int = 100) -> str:
    """Truncate string to maximum length"""
    if len(text) > max_length:
        return text[:max_length - 3] + "..."
    return text


def capitalize_first(text: str) -> str:
    """Capitalize first letter of string"""
    if not text:
        return text
    return text[0].upper() + text[1:]


def is_empty(value: Any) -> bool:
    """Check if value is empty"""
    if value is None:
        return True
    if isinstance(value, str):
        return len(value.strip()) == 0
    if isinstance(value, (list, dict)):
        return len(value) == 0
    return False
