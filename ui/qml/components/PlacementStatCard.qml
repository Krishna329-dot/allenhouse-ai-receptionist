import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Placement Stat Card Component
*/

Rectangle {
    id: card
    width: 180
    height: 120
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string number: "0"
    property string label: "Stat"
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 8
        anchors.centerIn: parent
        
        Text {
            text: number
            color: "#F4B860"
            font.pixelSize: 28
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
        
        Text {
            text: label
            color: "#003DA5"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }
}
