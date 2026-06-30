import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Feature Card Component
  Displays feature information in explore page
*/

Rectangle {
    id: card
    width: 300
    height: 180
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string title: "Feature"
    property string description: "Description"
    property string icon: "icon"
    
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
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 12
        
        Rectangle {
            width: 50
            height: 50
            color: "#E3F2FD"
            radius: 8
            
            Text {
                anchors.centerIn: parent
                text: icon
                font.pixelSize: 28
                color: "#003DA5"
            }
        }
        
        Text {
            text: title
            color: "#003DA5"
            font.pixelSize: 14
            font.bold: true
        }
        
        Text {
            text: description
            color: "#666666"
            font.pixelSize: 12
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            lineHeight: 1.4
        }
        
        Item { Layout.fillHeight: true }
    }
}
