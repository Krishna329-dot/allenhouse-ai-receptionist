import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Process Step Component
  Shows placement process steps
*/

Rectangle {
    id: step
    width: parent.width
    height: 100
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property int stepNumber: 1
    property string stepTitle: "Step"
    property string stepDescription: "Description"
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 15
        
        Rectangle {
            width: 50
            height: 50
            radius: 25
            color: "#003DA5"
            Layout.alignment: Qt.AlignVCenter
            
            Text {
                anchors.centerIn: parent
                text: stepNumber.toString()
                color: "#F4B860"
                font.pixelSize: 20
                font.bold: true
            }
        }
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 5
            
            Text {
                text: stepTitle
                color: "#003DA5"
                font.pixelSize: 14
                font.bold: true
            }
            
            Text {
                text: stepDescription
                color: "#666666"
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }
    }
}
