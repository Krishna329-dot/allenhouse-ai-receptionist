import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Quick Access Card Component
  Used in home page for quick navigation
*/

Rectangle {
    id: card
    width: 200
    height: 120
    color: "#FFFFFF"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string title: "Card"
    property string icon: "icon"
    property string cardColor: "#E3F2FD"
    property alias color: card.cardColor
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: {
            card.border.width = 2
            card.border.color = "#003DA5"
            scaleAnimation.to = 1.05
            scaleAnimation.start()
        }
        
        onExited: {
            card.border.width = 1
            card.border.color = "#E0E0E0"
            scaleAnimation.to = 1.0
            scaleAnimation.start()
        }
        
        onClicked: console.log("Clicked:", title)
    }
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 10
        
        Rectangle {
            width: 50
            height: 50
            color: card.cardColor
            radius: 8
            Layout.alignment: Qt.AlignHCenter
            
            Text {
                anchors.centerIn: parent
                text: icon
                font.pixelSize: 24
                color: "#003DA5"
            }
        }
        
        Text {
            text: title
            color: "#1A1A1A"
            font.pixelSize: 13
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }
    
    NumberAnimation {
        id: scaleAnimation
        target: card
        property: "scale"
        duration: 200
        easing.type: Easing.OutQuad
    }
}
