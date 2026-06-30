import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Status Indicator Component
  Shows system status with colored dot
*/

RowLayout {
    spacing: 6
    
    property string iconName: "status"
    property string label: "Status"
    property bool isActive: true
    
    Rectangle {
        width: 10
        height: 10
        radius: 5
        color: isActive ? "#4CAF50" : "#BDBDBD"
    }
    
    Text {
        text: label
        color: isActive ? "#2E7D32" : "#888888"
        font.pixelSize: 11
    }
}
