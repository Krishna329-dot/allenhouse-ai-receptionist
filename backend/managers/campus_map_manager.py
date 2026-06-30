"""
Campus locations and navigation data
"""

from typing import List, Optional
from backend.models.data_models import Location


class CampusMapManager:
    """Manages campus map and location data"""
    
    def __init__(self):
        """Initialize campus map manager"""
        self._locations = self._initialize_locations()
    
    def _initialize_locations(self) -> List[Location]:
        """Initialize campus locations"""
        return [
            Location(
                name="BCA Block",
                x=750,
                y=300,
                description="Computer Science & Engineering Department",
                building_block="BCA"
            ),
            Location(
                name="MBA Block",
                x=950,
                y=250,
                description="Business Administration Department",
                building_block="MBA"
            ),
            Location(
                name="Science Block",
                x=550,
                y=400,
                description="Physics, Chemistry & Science Departments",
                building_block="Science"
            ),
            Location(
                name="Library",
                x=850,
                y=500,
                description="Central Library - 8 AM to 8 PM",
                building_block="Library"
            ),
            Location(
                name="Auditorium",
                x=450,
                y=200,
                description="Main Auditorium - Capacity 1500",
                building_block="Auditorium"
            ),
            Location(
                name="Cafeteria",
                x=650,
                y=600,
                description="Central Cafeteria - 7 AM to 8 PM",
                building_block="Cafeteria"
            ),
            Location(
                name="Hostel",
                x=300,
                y=500,
                description="Boys & Girls Hostel",
                building_block="Hostel"
            ),
            Location(
                name="Administrative Block",
                x=750,
                y=150,
                description="Administration & Admissions Office",
                building_block="Admin"
            ),
            Location(
                name="Sports Ground",
                x=1100,
                y=600,
                description="Sports Complex",
                building_block="Sports"
            ),
            Location(
                name="Parking",
                x=1200,
                y=400,
                description="Vehicle Parking Area",
                building_block="Parking"
            )
        ]
    
    def get_all_locations(self) -> List[Location]:
        """Get all campus locations"""
        return self._locations
    
    def get_location_by_name(self, name: str) -> Optional[Location]:
        """Get location by name"""
        for loc in self._locations:
            if loc.name.lower() == name.lower():
                return loc
        return None
    
    def get_location_by_block(self, block: str) -> Optional[Location]:
        """Get location by building block"""
        for loc in self._locations:
            if loc.building_block.lower() == block.lower():
                return loc
        return None
    
    def search_locations(self, keyword: str) -> List[Location]:
        """Search locations by keyword"""
        keyword_lower = keyword.lower()
        results = []
        for loc in self._locations:
            if (keyword_lower in loc.name.lower() or
                keyword_lower in loc.description.lower() or
                keyword_lower in loc.building_block.lower()):
                results.append(loc)
        return results
