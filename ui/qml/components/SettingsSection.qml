import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Settings Section Component
  Groups related settings
*/

Rectangle {
    id: section
    width: parent.width
    color: "transparent"
    
    property string title: "Section"
    property alias content: contentArea.children
    
    default property alias contentChildren: contentArea.children
    
    ColumnLayout {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 20
        }
        spacing: 15
        
        Text {
            text: title
            color: "#003DA5"
            font.pixelSize: 14
            font.bold: true
        }
        
        ColumnLayout {
            id: contentArea
            Layout.fillWidth: true
            spacing: 15
        }
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#E0E0E0"
        }
    }
}
