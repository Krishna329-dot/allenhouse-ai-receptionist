import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Admission Info Card Component
  Shows admission information in grid
*/

Rectangle {
    id: card
    width: 350
    height: 200
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string title: "Title"
    property var items: []
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 10
        
        Text {
            text: title
            color: "#003DA5"
            font.pixelSize: 14
            font.bold: true
        }
        
        Column {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 8
            
            Repeater {
                model: items.length
                delegate: RowLayout {
                    spacing: 8
                    
                    Text {
                        text: "•"
                        color: "#F4B860"
                        font.pixelSize: 12
                        font.bold: true
                    }
                    
                    Text {
                        text: items[index]
                        color: "#666666"
                        font.pixelSize: 11
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}
