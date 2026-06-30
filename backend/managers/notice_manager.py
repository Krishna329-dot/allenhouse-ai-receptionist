"""
Notice manager for handling notices data
"""

from typing import List, Optional
from backend.models.data_models import Notice


class NoticeManager:
    """Manages notices data and operations"""
    
    def __init__(self):
        """Initialize notice manager with dummy data"""
        self._notices = self._initialize_dummy_notices()
    
    def _initialize_dummy_notices(self) -> List[Notice]:
        """Initialize with dummy notice data"""
        return [
            Notice(
                id="notice_001",
                title="Admission Open 2024-25",
                content="Admissions are now open for various UG/PG courses. Apply now for various UG/PG courses.",
                date_posted="19 May 2024",
                category="Academic",
                priority="high"
            ),
            Notice(
                id="notice_002",
                title="Holiday Notice",
                content="College will remain closed on 21 May. College will remain closed on 21 May for maintenance.",
                date_posted="18 May 2024",
                category="Administration",
                priority="high"
            ),
            Notice(
                id="notice_003",
                title="Exam Schedule Released",
                content="Mid Semester Exams from 27 May. Exam schedule has been released. Please check your portal.",
                date_posted="17 May 2024",
                category="Academic",
                priority="medium"
            ),
            Notice(
                id="notice_004",
                title="Scholarship Applications",
                content="Last date extended to 31 May 2024. Apply for various scholarship programs.",
                date_posted="16 May 2024",
                category="Financial Aid",
                priority="medium"
            ),
            Notice(
                id="notice_005",
                title="Library Timings",
                content="Library timings updated: 8 AM - 8 PM on weekdays, 9 AM - 5 PM on weekends.",
                date_posted="15 May 2024",
                category="General",
                priority="low"
            )
        ]
    
    def get_all_notices(self) -> List[Notice]:
        """Get all notices"""
        return self._notices
    
    def get_latest_notices(self, limit: int = 5) -> List[Notice]:
        """Get latest notices limited to specified count"""
        return self._notices[:limit]
    
    def get_notices_by_priority(self, priority: str) -> List[Notice]:
        """Get notices filtered by priority"""
        return [n for n in self._notices if n.priority == priority]
    
    def get_notices_by_category(self, category: str) -> List[Notice]:
        """Get notices filtered by category"""
        return [n for n in self._notices if n.category == category]
    
    def get_notice_by_id(self, notice_id: str) -> Optional[Notice]:
        """Get notice by ID"""
        for notice in self._notices:
            if notice.id == notice_id:
                return notice
        return None
