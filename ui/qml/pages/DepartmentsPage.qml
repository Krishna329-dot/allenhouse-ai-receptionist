import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Departments Page
  Displays all departments with information
*/

Rectangle {
    id: departmentsPage
    color: "#FFFFFF"
    
    Flickable {
        anchors.fill: parent
        contentHeight: mainColumn.implicitHeight
        clip: true
        
        ColumnLayout {
            id: mainColumn
            width: parent.width
            spacing: 20
            
            // Header
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "#003DA5"
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    
                    Text {
                        text: "Departments"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Choose your field of interest"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Department Cards
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 15
                
                DepartmentCard {
                    deptName: "Computer Science & Engineering"
                    hod: "Dr. Rajesh Kumar"
                    email: "rajesh.kumar@allenhouse.edu"
                    phone: "+91-9876543210"
                    location: "BCA Block"
                    description: "Leading department in computer science with state-of-the-art labs"
                }
                
                DepartmentCard {
                    deptName: "Business Administration"
                    hod: "Prof. Priya Sharma"
                    email: "priya.sharma@allenhouse.edu"
                    phone: "+91-9876543211"
                    location: "MBA Block"
                    description: "Premier management program with industry-focused curriculum"
                }
                
                DepartmentCard {
                    deptName: "Physics"
                    hod: "Dr. Amit Verma"
                    email: "amit.verma@allenhouse.edu"
                    phone: "+91-9876543212"
                    location: "Science Block"
                    description: "Department dedicated to physics research and education"
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
