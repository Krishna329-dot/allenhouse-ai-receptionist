import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Event Card Component
  Shows event information in timeline format
*/

Rectangle {
    id: card
    width: parent.width
    height: 140
    color: "#FFFFFF"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string date: "Date"
    property string title: "Event"
    property string time: "Time"
    property string location: "Location"
    property string attendees: "Attendees"
    property string cardColor: "#E3F2FD"
    property alias color: card.cardColor
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: {
            card.border.width = 2
            card.border.color = "#003DA5"
        }
        
        onExited: {
            card.border.width = 1
            card.border.color = "#E0E0E0"
        }
    }
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 15
        
        Rectangle {
            Layout.preferredWidth: 80
            Layout.preferredHeight: 80
            color: cardColor
            radius: 8
            Layout.alignment: Qt.AlignTop
            
            ColumnLayout {
                anchors {
                    fill: parent
                    margins: 10
                }
                spacing: 3
                
                Text {
                    text: date
                    color: "#003DA5"
                    font.pixelSize: 16
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.fillWidth: true
                }
                
                Text {
                    text: "📅"
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    Layout.fillWidth: true
                }
            }
        }
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 6
            
            Text {
                text: title
                color: "#003DA5"
                font.pixelSize: 14
                font.bold: true
            }
            
            RowLayout {
                spacing: 15
                
                Text {
                    text: `🕐 ${time}`
                    color: "#666666"
                    font.pixelSize: 11
                }
                
                Text {
                    text: `📍 ${location}`
                    color: "#666666"
                    font.pixelSize: 11
                }
            }
            
            Text {
                text: `👥 ${attendees}`
                color: "#888888"
                font.pixelSize: 10
            }
        }
        
        Button {
            text: "Register"
            Layout.preferredWidth: 80
            Layout.preferredHeight: 35
            background: Rectangle {
                color: "#F4B860"
                radius: 4
            }
            contentItem: Text {
                text: parent.text
                color: "#003DA5"
                font.pixelSize: 11
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
