import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Campus Map Page
  Interactive campus navigation and building locations
*/

Rectangle {
    id: mapPage
    color: "#FFFFFF"
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Header
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "#003DA5"
            
            RowLayout {
                anchors {
                    fill: parent
                    margins: 15
                }
                spacing: 15
                
                Text {
                    text: "Campus Map"
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.bold: true
                }
                
                Item { Layout.fillWidth: true }
                
                Button {
                    text: "Explore in 3D"
                    background: Rectangle {
                        color: "#F4B860"
                        radius: 4
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#003DA5"
                        font.pixelSize: 12
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            
            // Map Area
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#E8F4F8"
                
                Image {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    source: "../assets/images/campus_map.jpg"
                    fillMode: Image.PreserveAspectFit
                    
                    // Map pins overlay
                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        
                        // Sample location pins
                        MapPin {
                            x: 300
                            y: 100
                            name: "BCA Block"
                        }
                        
                        MapPin {
                            x: 500
                            y: 80
                            name: "Auditorium"
                        }
                    }
                }
                
                // Zoom controls
                ColumnLayout {
                    anchors {
                        right: parent.right
                        top: parent.top
                        margins: 20
                    }
                    spacing: 5
                    
                    Button {
                        text: "+"
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        background: Rectangle {
                            color: "#003DA5"
                            radius: 4
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 18
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    
                    Button {
                        text: "−"
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        background: Rectangle {
                            color: "#003DA5"
                            radius: 4
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 18
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            
            // Sidebar with locations
            Rectangle {
                Layout.preferredWidth: 300
                Layout.fillHeight: true
                color: "#F5F5F5"
                border.color: "#E0E0E0"
                border.width: 1
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 15
                    }
                    spacing: 15
                    
                    Text {
                        text: "Campus Locations"
                        color: "#003DA5"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    
                    ListView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: locationModel
                        spacing: 8
                        clip: true
                        
                        delegate: LocationItem {
                            width: parent.width
                            locationName: modelData.name
                            locationDesc: modelData.desc
                        }
                    }
                    
                    Button {
                        text: "Get Directions"
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#F4B860"
                            radius: 4
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "#003DA5"
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
    }
    
    ListModel {
        id: locationModel
        ListElement { name: "BCA Block"; desc: "Computer Science Department" }
        ListElement { name: "MBA Block"; desc: "Business Administration" }
        ListElement { name: "Library"; desc: "Central Library" }
        ListElement { name: "Auditorium"; desc: "Main Auditorium" }
        ListElement { name: "Cafeteria"; desc: "Central Cafeteria" }
        ListElement { name: "Hostel"; desc: "Boys & Girls Hostel" }
    }
}
