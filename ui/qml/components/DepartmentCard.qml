import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Department Card Component
  Shows detailed department information
*/

Rectangle {
    id: card
    width: parent.width
    height: 160
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string deptName: "Department"
    property string hod: "HOD Name"
    property string email: "email@example.com"
    property string phone: "+91-XXXXXXXXXX"
    property string location: "Location"
    property string description: "Description"
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: {
            card.color = "#FFFFFF"
            card.border.width = 2
            card.border.color = "#003DA5"
        }
        
        onExited: {
            card.color = "#F5F5F5"
            card.border.width = 1
            card.border.color = "#E0E0E0"
        }
    }
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 20
        
        Rectangle {
            width: 60
            height: 60
            color: "#E3F2FD"
            radius: 8
            Layout.alignment: Qt.AlignTop
            
            Text {
                anchors.centerIn: parent
                text: "🏢"
                font.pixelSize: 32
            }
        }
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 5
            
            Text {
                text: deptName
                color: "#003DA5"
                font.pixelSize: 14
                font.bold: true
            }
            
            Text {
                text: description
                color: "#666666"
                font.pixelSize: 11
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            RowLayout {
                spacing: 20
                
                Text {
                    text: `📍 ${location}`
                    color: "#888888"
                    font.pixelSize: 10
                }
                
                Text {
                    text: `👤 ${hod}`
                    color: "#888888"
                    font.pixelSize: 10
                }
            }
        }
        
        Button {
            text: "Contact"
            Layout.preferredWidth: 80
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
