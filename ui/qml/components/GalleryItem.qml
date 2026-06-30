import QtQuick
import QtQuick.Controls

/*
  Gallery Item Component
  Shows individual gallery photos
*/

Rectangle {
    id: item
    width: 300
    height: 250
    color: "#E0E0E0"
    radius: 8
    clip: true
    
    property int imageId: 1
    
    Image {
        anchors.fill: parent
        source: `../assets/images/gallery_${imageId}.jpg`
        fillMode: Image.PreserveAspectCrop
    }
    
    Rectangle {
        anchors.fill: parent
        color: "#00000040"
        opacity: 0
    }
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: overlayAnimation.start()
        onExited: overlayAnimation.stop()
    }
    
    NumberAnimation {
        id: overlayAnimation
        target: item.children[1]
        property: "opacity"
        to: 1
        duration: 300
    }
    
    Button {
        anchors.centerIn: parent
        text: "View"
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
