"""
Facility manager for handling campus facilities data
"""

from typing import List, Optional
from backend.models.data_models import Facility


class FacilityManager:
    """Manages campus facilities data and operations"""
    
    def __init__(self):
        """Initialize facility manager with dummy data"""
        self._facilities = self._initialize_dummy_facilities()
    
    def _initialize_dummy_facilities(self) -> List[Facility]:
        """Initialize with dummy facility data"""
        return [
            Facility(
                id="fac_001",
                name="Main Library",
                type="Library",
                location="Central Campus",
                capacity=500,
                availability="Open: 8 AM - 8 PM",
                contact="library@allenhouse.edu"
            ),
            Facility(
                id="fac_002",
                name="Boys Hostel",
                type="Hostel",
                location="North Campus",
                capacity=300,
                availability="24/7",
                contact="hostel@allenhouse.edu"
            ),
            Facility(
                id="fac_003",
                name="Girls Hostel",
                type="Hostel",
                location="South Campus",
                capacity=200,
                availability="24/7",
                contact="hostel@allenhouse.edu"
            ),
            Facility(
                id="fac_004",
                name="Central Cafeteria",
                type="Cafeteria",
                location="Main Building",
                capacity=400,
                availability="Open: 7 AM - 8 PM",
                contact="cafeteria@allenhouse.edu"
            ),
            Facility(
                id="fac_005",
                name="Sports Complex",
                type="Sports",
                location="Sports Ground",
                capacity=1000,
                availability="Open: 6 AM - 10 PM",
                contact="sports@allenhouse.edu"
            ),
            Facility(
                id="fac_006",
                name="Medical Center",
                type="Healthcare",
                location="Main Campus",
                capacity=50,
                availability="24/7",
                contact="medical@allenhouse.edu"
            ),
            Facility(
                id="fac_007",
                name="Computer Lab 1",
                type="Laboratory",
                location="BCA Block",
                capacity=45,
                availability="Open: 8 AM - 6 PM",
                contact="cse@allenhouse.edu"
            ),
            Facility(
                id="fac_008",
                name="Auditorium",
                type="Conference Hall",
                location="Central Campus",
                capacity=1500,
                availability="Available for bookings",
                contact="events@allenhouse.edu"
            )
        ]
    
    def get_all_facilities(self) -> List[Facility]:
        """Get all facilities"""
        return self._facilities
    
    def get_facilities_by_type(self, facility_type: str) -> List[Facility]:
        """Get facilities filtered by type"""
        return [f for f in self._facilities if f.type == facility_type]
    
    def get_facility_by_id(self, facility_id: str) -> Optional[Facility]:
        """Get facility by ID"""
        for facility in self._facilities:
            if facility.id == facility_id:
                return facility
        return None
    
    def get_facilities_by_location(self, location: str) -> List[Facility]:
        """Get facilities filtered by location"""
        return [f for f in self._facilities if location.lower() in f.location.lower()]
