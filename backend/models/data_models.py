"""
Data models and structures for Allenhouse AI Receptionist
"""

from dataclasses import dataclass, field
from typing import List, Optional
from datetime import datetime
from enum import Enum


class EventType(Enum):
    """Event types"""
    ACADEMIC = "academic"
    CULTURAL = "cultural"
    SPORTS = "sports"
    PLACEMENT = "placement"
    WORKSHOP = "workshop"


class DepartmentType(Enum):
    """Department types"""
    ENGINEERING = "engineering"
    MANAGEMENT = "management"
    SCIENCE = "science"
    HUMANITIES = "humanities"


@dataclass
class Location:
    """Location information"""
    name: str
    x: float
    y: float
    description: str
    building_block: str


@dataclass
class Event:
    """Event information"""
    id: str
    title: str
    description: str
    date: str
    start_time: str
    end_time: str
    location: str
    event_type: EventType
    attendees: int = 0
    image_url: Optional[str] = None
    

@dataclass
class Department:
    """Department information"""
    id: str
    name: str
    dept_type: DepartmentType
    hod_name: str
    hod_email: str
    phone: str
    location: str
    description: str
    courses: List[str] = field(default_factory=list)


@dataclass
class Notice:
    """Notice information"""
    id: str
    title: str
    content: str
    date_posted: str
    category: str
    priority: str  # high, medium, low
    attachment_url: Optional[str] = None


@dataclass
class Course:
    """Course information"""
    id: str
    code: str
    name: str
    department: str
    credits: int
    duration_years: int
    description: str
    eligibility: str


@dataclass
class Facility:
    """Campus facility information"""
    id: str
    name: str
    type: str
    location: str
    capacity: int
    availability: str
    contact: str


@dataclass
class Message:
    """Chat message structure"""
    id: str
    sender: str  # "user" or "assistant"
    content: str
    timestamp: str
    message_type: str  # "text", "voice", "suggestion"
    confidence: float = 1.0


@dataclass
class Quote:
    """Daily quote"""
    text: str
    author: str


@dataclass
class WeatherData:
    """Weather information"""
    temperature: int
    condition: str  # sunny, cloudy, rainy, etc.
    humidity: int
    wind_speed: int
    city: str
    country: str


@dataclass
class SystemStatus:
    """System status information"""
    microphone: bool
    speaker: bool
    network: bool
    llm_status: str  # online, offline, loading
    database: bool
    camera: bool
    power: bool
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())
