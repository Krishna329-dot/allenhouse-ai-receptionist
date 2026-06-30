"""
Department manager for handling departments data
"""

from typing import List, Optional
from backend.models.data_models import Department, DepartmentType


class DepartmentManager:
    """Manages departments data and operations"""
    
    def __init__(self):
        """Initialize department manager with dummy data"""
        self._departments = self._initialize_dummy_departments()
    
    def _initialize_dummy_departments(self) -> List[Department]:
        """Initialize with dummy department data"""
        return [
            Department(
                id="dept_001",
                name="Computer Science & Engineering",
                dept_type=DepartmentType.ENGINEERING,
                hod_name="Dr. Rajesh Kumar",
                hod_email="rajesh.kumar@allenhouse.edu",
                phone="+91-9876543210",
                location="BCA Block",
                description="Leading department in computer science and engineering with state-of-the-art labs",
                courses=["B.Tech CSE", "B.Sc CS", "M.Tech CSE"]
            ),
            Department(
                id="dept_002",
                name="Business Administration",
                dept_type=DepartmentType.MANAGEMENT,
                hod_name="Prof. Priya Sharma",
                hod_email="priya.sharma@allenhouse.edu",
                phone="+91-9876543211",
                location="MBA Block",
                description="Premier management program with industry-focused curriculum",
                courses=["MBA", "BBA", "Executive MBA"]
            ),
            Department(
                id="dept_003",
                name="Physics",
                dept_type=DepartmentType.SCIENCE,
                hod_name="Dr. Amit Verma",
                hod_email="amit.verma@allenhouse.edu",
                phone="+91-9876543212",
                location="Science Block",
                description="Department dedicated to physics research and education",
                courses=["B.Sc Physics", "M.Sc Physics"]
            ),
            Department(
                id="dept_004",
                name="Chemistry",
                dept_type=DepartmentType.SCIENCE,
                hod_name="Dr. Neha Singh",
                hod_email="neha.singh@allenhouse.edu",
                phone="+91-9876543213",
                location="Science Block",
                description="Advanced chemistry program with modern laboratory facilities",
                courses=["B.Sc Chemistry", "M.Sc Chemistry"]
            ),
            Department(
                id="dept_005",
                name="English",
                dept_type=DepartmentType.HUMANITIES,
                hod_name="Prof. Kavita Patel",
                hod_email="kavita.patel@allenhouse.edu",
                phone="+91-9876543214",
                location="Humanities Block",
                description="English literature and communication studies",
                courses=["B.A English", "M.A English"]
            )
        ]
    
    def get_all_departments(self) -> List[Department]:
        """Get all departments"""
        return self._departments
    
    def get_departments_by_type(self, dept_type: DepartmentType) -> List[Department]:
        """Get departments filtered by type"""
        return [d for d in self._departments if d.dept_type == dept_type]
    
    def get_department_by_id(self, dept_id: str) -> Optional[Department]:
        """Get department by ID"""
        for dept in self._departments:
            if dept.id == dept_id:
                return dept
        return None
    
    def get_department_by_name(self, name: str) -> Optional[Department]:
        """Get department by name"""
        for dept in self._departments:
            if dept.name.lower() == name.lower():
                return dept
        return None
