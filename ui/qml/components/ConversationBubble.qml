import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Conversation Bubble Component
  Shows chat messages from user and assistant
*/

Rectangle {
    id: bubble
    width: parent.width
    height: messageText.implicitHeight + 20
    
    property string senderType: "user" // "user" or "assistant"
    property string messageText: "Message"
    
    color: "transparent"
    
    RowLayout {
        anchors.fill: parent
        spacing: 10
        
        if (senderType === "user") {
            Item { Layout.fillWidth: true }
        }
        
        Rectangle {
            Layout.preferredWidth: Math.min(messageTextDisplay.implicitWidth + 20, 400)
            Layout.preferredHeight: messageTextDisplay.implicitHeight + 15
            color: senderType === "user" ? "#003DA5" : "#F5F5F5"
            radius: 8
            border.color: senderType === "user" ? "#003DA5" : "#E0E0E0"
            border.width: 1
            
            Text {
                id: messageTextDisplay
                anchors {
                    fill: parent
                    margins: 10
                }
                text: messageText
                color: senderType === "user" ? "white" : "#1A1A1A"
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
            }
        }
        
        if (senderType === "assistant") {
            Item { Layout.fillWidth: true }
        }
    }
}
