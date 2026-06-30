import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Location Item Component
  Used in campus map sidebar
*/

Rectangle {
    id: item
    width: 280
    height: 70
    color: "transparent"
    radius: 6
    
    property string locationName: "Location"
    property string locationDesc: "Description"
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: item.color = "#E8F4F8"
        onExited: item.color = "transparent"
    }
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 4
        
        Text {
            text: locationName
            color: "#003DA5"
            font.pixelSize: 13
            font.bold: true
        }
        
        Text {
            text: locationDesc
            color: "#888888"
            font.pixelSize: 11
        }
    }
}
