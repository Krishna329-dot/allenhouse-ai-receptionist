import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Events Page
  Displays upcoming events and activities
*/

Rectangle {
    id: eventsPage
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
                        text: "Upcoming Events"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Stay updated with college activities"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Events Timeline
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 15
                
                EventCard {
                    date: "25 May"
                    title: "Annual Tech Fest 2024"
                    time: "10:00 AM - 6:00 PM"
                    location: "Main Auditorium"
                    attendees: "500+ attendees"
                    color: "#E3F2FD"
                }
                
                EventCard {
                    date: "30 May"
                    title: "Workshop on AI & Robotics"
                    time: "2:00 PM - 5:00 PM"
                    location: "Seminar Hall"
                    attendees: "150 participants"
                    color: "#F3E5F5"
                }
                
                EventCard {
                    date: "05 June"
                    title: "Placement Drive"
                    time: "9:00 AM - 4:00 PM"
                    location: "Placement Office"
                    attendees: "200 students"
                    color: "#E8F5E9"
                }
                
                EventCard {
                    date: "12-14 June"
                    title: "Sports Meet 2024"
                    time: "8:00 AM - 6:00 PM"
                    location: "Sports Ground"
                    attendees: "300+ participants"
                    color: "#FFF3E0"
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
