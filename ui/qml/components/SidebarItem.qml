import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Sidebar Item Component
  Individual navigation item with hover effects
*/

Rectangle {
    id: sidebarItem
    width: parent.width
    height: 60
    color: isActive ? "#0052CC" : "transparent"
    
    property string itemText: "Item"
    property string itemIcon: "icon"
    property string itemPage: "page"
    property bool isActive: false
    
    signal clicked()
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onClicked: sidebarItem.clicked()
        
        onEntered: {
            if (!isActive) {
                sidebarItem.color = "rgba(255, 255, 255, 0.1)"
            }
        }
        
        onExited: {
            if (!isActive) {
                sidebarItem.color = "transparent"
            }
        }
    }
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 15
        
        // Icon
        Image {
            source: `../assets/icons/${itemIcon}.svg`
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            sourceSize: Qt.size(24, 24)
        }
        
        // Text
        Text {
            text: itemText
            color: isActive ? "white" : "#E0E0E0"
            font.pixelSize: 14
            Layout.fillWidth: true
        }
        
        // Active indicator
        Rectangle {
            visible: isActive
            width: 3
            height: 30
            radius: 1.5
            color: "#F4B860"
            Layout.alignment: Qt.AlignRight
        }
    }
}
