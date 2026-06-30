import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Highlight Card Component
  Shows statistics and achievements
*/

Rectangle {
    id: card
    width: 220
    height: 140
    color: "#003DA5"
    radius: 8
    
    property string number: "0"
    property string title: "Title"
    property string icon: "icon"
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 10
        
        Text {
            text: number
            color: "#F4B860"
            font.pixelSize: 28
            font.bold: true
        }
        
        Text {
            text: title
            color: "#FFFFFF"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
    }
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: card.opacity = 0.9
        onExited: card.opacity = 1.0
    }
}
