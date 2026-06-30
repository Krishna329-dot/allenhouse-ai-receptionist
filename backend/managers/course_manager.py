"""
Course manager for handling courses data
"""

from typing import List, Optional
from backend.models.data_models import Course


class CourseManager:
    """Manages courses data and operations"""
    
    def __init__(self):
        """Initialize course manager with dummy data"""
        self._courses = self._initialize_dummy_courses()
    
    def _initialize_dummy_courses(self) -> List[Course]:
        """Initialize with dummy course data"""
        return [
            Course(
                id="course_001",
                code="B.TECH-CSE-001",
                name="Bachelor of Technology in Computer Science & Engineering",
                department="Computer Science & Engineering",
                credits=180,
                duration_years=4,
                description="Comprehensive program covering software development, databases, networking, and AI/ML",
                eligibility="12th Pass with Physics, Chemistry, Mathematics"
            ),
            Course(
                id="course_002",
                code="MBA-001",
                name="Master of Business Administration",
                department="Business Administration",
                credits=90,
                duration_years=2,
                description="Executive MBA with focus on management, finance, and strategy",
                eligibility="Bachelor's degree with minimum 50% marks"
            ),
            Course(
                id="course_003",
                code="BBA-001",
                name="Bachelor of Business Administration",
                department="Business Administration",
                credits=120,
                duration_years=3,
                description="Foundation program in business management and administration",
                eligibility="12th Pass from any stream"
            ),
            Course(
                id="course_004",
                code="B.SC-CS-001",
                name="Bachelor of Science in Computer Science",
                department="Computer Science & Engineering",
                credits=120,
                duration_years=3,
                description="Science-focused program in computer science with theoretical foundation",
                eligibility="12th Pass with Mathematics"
            ),
            Course(
                id="course_005",
                code="M.TECH-CSE-001",
                name="Master of Technology in Computer Science & Engineering",
                department="Computer Science & Engineering",
                credits=72,
                duration_years=2,
                description="Advanced specialization in CSE with research opportunities",
                eligibility="B.Tech/B.Sc with 60% marks"
            )
        ]
    
    def get_all_courses(self) -> List[Course]:
        """Get all courses"""
        return self._courses
    
    def get_courses_by_department(self, department: str) -> List[Course]:
        """Get courses filtered by department"""
        return [c for c in self._courses if c.department == department]
    
    def get_course_by_id(self, course_id: str) -> Optional[Course]:
        """Get course by ID"""
        for course in self._courses:
            if course.id == course_id:
                return course
        return None
    
    def get_course_by_code(self, code: str) -> Optional[Course]:
        """Get course by code"""
        for course in self._courses:
            if course.code == code:
                return course
        return None
