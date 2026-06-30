"""
Event manager for handling events data
"""

from typing import List, Optional
from backend.models.data_models import Event, EventType


class EventManager:
    """Manages events data and operations"""
    
    def __init__(self):
        """Initialize event manager with dummy data"""
        self._events = self._initialize_dummy_events()
    
    def _initialize_dummy_events(self) -> List[Event]:
        """Initialize with dummy event data"""
        return [
            Event(
                id="evt_001",
                title="Annual Tech Fest 2024",
                description="Grand annual technology festival featuring innovations, competitions, and tech talks",
                date="25 May 2024",
                start_time="10:00 AM",
                end_time="6:00 PM",
                location="Main Auditorium",
                event_type=EventType.ACADEMIC,
                attendees=500,
                image_url="assets/images/tech_fest.jpg"
            ),
            Event(
                id="evt_002",
                title="Workshop on AI & Robotics",
                description="Hands-on workshop on artificial intelligence and robotics applications",
                date="30 May 2024",
                start_time="2:00 PM",
                end_time="5:00 PM",
                location="Seminar Hall",
                event_type=EventType.WORKSHOP,
                attendees=150
            ),
            Event(
                id="evt_003",
                title="Placement Drive",
                description="Placement drive for B.Tech & MBA students with leading companies",
                date="05 June 2024",
                start_time="9:00 AM",
                end_time="4:00 PM",
                location="Placement Office",
                event_type=EventType.PLACEMENT,
                attendees=200
            ),
            Event(
                id="evt_004",
                title="Sports Meet 2024",
                description="Inter-college sports competition with various athletic events",
                date="12-14 June 2024",
                start_time="8:00 AM",
                end_time="6:00 PM",
                location="Sports Ground",
                event_type=EventType.SPORTS,
                attendees=300
            ),
            Event(
                id="evt_005",
                title="Cultural Fest",
                description="Celebration of diverse cultures through music, dance, and art",
                date="20 June 2024",
                start_time="5:00 PM",
                end_time="10:00 PM",
                location="Open Ground",
                event_type=EventType.CULTURAL,
                attendees=400
            )
        ]
    
    def get_all_events(self) -> List[Event]:
        """Get all events"""
        return self._events
    
    def get_upcoming_events(self, limit: int = 5) -> List[Event]:
        """Get upcoming events limited to specified count"""
        return self._events[:limit]
    
    def get_events_by_type(self, event_type: EventType) -> List[Event]:
        """Get events filtered by type"""
        return [e for e in self._events if e.event_type == event_type]
    
    def get_event_by_id(self, event_id: str) -> Optional[Event]:
        """Get event by ID"""
        for event in self._events:
            if event.id == event_id:
                return event
        return None
