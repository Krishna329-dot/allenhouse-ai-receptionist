import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Footer Component
  Displays system status indicators
*/

Rectangle {
    id: footer
    color: "#F5F5F5"
    border.color: "#E0E0E0"
    border.width: 1
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 20
        
        // System Status Title
        Text {
            text: "System Status"
            color: "#1A1A1A"
            font.pixelSize: 12
            font.bold: true
        }
        
        // Status Items
        StatusIndicator {
            iconName: "microphone"
            label: "Mic"
            isActive: true
        }
        
        StatusIndicator {
            iconName: "speaker"
            label: "Speaker"
            isActive: true
        }
        
        StatusIndicator {
            iconName: "network"
            label: "Network"
            isActive: true
        }
        
        StatusIndicator {
            iconName: "database"
            label: "Database"
            isActive: true
        }
        
        StatusIndicator {
            iconName: "llm"
            label: "LLM"
            isActive: false
        }
        
        StatusIndicator {
            iconName: "power"
            label: "Power"
            isActive: true
        }
        
        Item { Layout.fillWidth: true }
        
        // All Systems Operational
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 200
            color: "#E8F5E9"
            radius: 4
            border.color: "#4CAF50"
            border.width: 1
            
            RowLayout {
                anchors {
                    fill: parent
                    margins: 8
                }
                spacing: 8
                
                Rectangle {
                    width: 8
                    height: 8
                    radius: 4
                    color: "#4CAF50"
                }
                
                Text {
                    text: "All Systems Operational"
                    color: "#2E7D32"
                    font.pixelSize: 11
                    font.bold: true
                }
            }
        }
    }
}
