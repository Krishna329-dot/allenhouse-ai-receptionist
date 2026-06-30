import QtQuick
import QtQuick.Controls

/*
  Map Pin Component
  Shows location marker on campus map
*/

Rectangle {
    id: pin
    width: 40
    height: 40
    radius: 20
    color: "#003DA5"
    border.color: "#FFFFFF"
    border.width: 2
    
    property string name: "Location"
    
    Text {
        anchors.centerIn: parent
        text: "📍"
        font.pixelSize: 20
    }
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: pinTooltip.visible = true
        onExited: pinTooltip.visible = false
    }
    
    Rectangle {
        id: pinTooltip
        visible: false
        x: parent.x + parent.width + 10
        y: parent.y - 15
        width: 120
        height: 30
        color: "#333333"
        radius: 4
        
        Text {
            anchors.centerIn: parent
            text: name
            color: "white"
            font.pixelSize: 12
        }
    }
}
