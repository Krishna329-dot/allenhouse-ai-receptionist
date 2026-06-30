import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Company Logo Component
  Shows company recruiters
*/

Rectangle {
    id: logo
    width: 160
    height: 100
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string companyName: "Company"
    
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        onEntered: {
            logo.color = "#FFFFFF"
            logo.border.width = 2
            logo.border.color = "#003DA5"
        }
        
        onExited: {
            logo.color = "#F5F5F5"
            logo.border.width = 1
            logo.border.color = "#E0E0E0"
        }
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        
        Text {
            text: companyName.charAt(0)
            color: "#003DA5"
            font.pixelSize: 40
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
        
        Text {
            text: companyName
            color: "#666666"
            font.pixelSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }
}
