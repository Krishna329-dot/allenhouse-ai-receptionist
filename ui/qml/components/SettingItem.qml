import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Setting Item Component
  Individual setting with label and control
*/

Rectangle {
    id: item
    width: parent.width
    height: 80
    color: "transparent"
    
    property string label: "Setting"
    property string description: "Description"
    property alias control: controlArea.children
    
    default property alias controlChildren: controlArea.children
    
    RowLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 20
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4
            
            Text {
                text: label
                color: "#1A1A1A"
                font.pixelSize: 13
                font.bold: true
            }
            
            Text {
                text: description
                color: "#888888"
                font.pixelSize: 11
            }
        }
        
        RowLayout {
            id: controlArea
            Layout.preferredWidth: 200
            spacing: 10
        }
    }
}
