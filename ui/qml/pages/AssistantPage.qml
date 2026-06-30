import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

/*
  Assistant Page
  Main voice assistant interface with microphone, conversation, and animations
*/

Rectangle {
    id: assistantPage
    color: "#FFFFFF"
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Header
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "#003DA5"
            
            Text {
                anchors.centerIn: parent
                text: "Voice Assistant"
                color: "#FFFFFF"
                font.pixelSize: 20
                font.bold: true
            }
        }
        
        // Main Content
        Flickable {
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: mainContent.implicitHeight
            clip: true
            
            ColumnLayout {
                id: mainContent
                width: parent.width
                spacing: 30
                
                Item { Layout.preferredHeight: 20 }
                
                // Microphone Button
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    width: 200
                    height: 200
                    radius: 100
                    color: "#003DA5"
                    Layout.topMargin: 40
                    
                    // Animated pulse rings
                    Rectangle {
                        id: pulseRing1
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        radius: 100
                        color: "transparent"
                        border.color: "#0052CC"
                        border.width: 2
                        
                        NumberAnimation on opacity {
                            running: true
                            loops: Animation.Infinite
                            from: 1
                            to: 0
                            duration: 1500
                        }
                        
                        PropertyAnimation on radius {
                            running: true
                            loops: Animation.Infinite
                            from: 100
                            to: 150
                            duration: 1500
                        }
                    }
                    
                    Rectangle {
                        id: pulseRing2
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        radius: 100
                        color: "transparent"
                        border.color: "#F4B860"
                        border.width: 2
                        
                        NumberAnimation on opacity {
                            running: true
                            loops: Animation.Infinite
                            from: 0.6
                            to: 0
                            duration: 1500
                            delay: 500
                        }
                        
                        PropertyAnimation on radius {
                            running: true
                            loops: Animation.Infinite
                            from: 100
                            to: 150
                            duration: 1500
                            delay: 500
                        }
                    }
                    
                    // Microphone icon
                    Text {
                        anchors.centerIn: parent
                        text: "🎤"
                        font.pixelSize: 80
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            isListening = !isListening
                            micStatus.text = isListening ? "Listening...": "Tap to speak"
                            micStatus.color = isListening ? "#4CAF50" : "#888888"
                        }
                    }
                }
                
                // Status text
                Text {
                    id: micStatus
                    text: "Tap to speak"
                    color: "#888888"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignHCenter
                }
                
                // Conversation area
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 400
                    Layout.margins: 20
                    Layout.topMargin: 10
                    color: "#F5F5F5"
                    radius: 8
                    border.color: "#E0E0E0"
                    border.width: 1
                    
                    ColumnLayout {
                        anchors {
                            fill: parent
                            margins: 15
                        }
                        spacing: 10
                        
                        Text {
                            text: "Conversation"
                            color: "#003DA5"
                            font.pixelSize: 14
                            font.bold: true
                        }
                        
                        ListView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            model: conversationModel
                            spacing: 10
                            clip: true
                            
                            delegate: ConversationBubble {
                                width: parent.width
                                senderType: modelData.sender
                                messageText: modelData.text
                            }
                        }
                    }
                }
                
                // Control buttons
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.margins: 20
                    spacing: 15
                    
                    Button {
                        text: "Stop"
                        background: Rectangle {
                            color: "#F44336"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 12
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                        }
                        onClicked: {
                            isListening = false
                            micStatus.text = "Stopped"
                        }
                    }
                    
                    Button {
                        text: "Clear"
                        background: Rectangle {
                            color: "#FF9800"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 12
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                        }
                        onClicked: conversationModel.clear()
                    }
                    
                    Button {
                        text: "Send"
                        background: Rectangle {
                            color: "#4CAF50"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 12
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                        }
                        onClicked: {
                            conversationModel.append({sender: "assistant", text: "How can I assist you?"})
                        }
                    }
                }
                
                Item { Layout.preferredHeight: 20 }
            }
        }
    }
    
    property bool isListening: false
    
    ListModel {
        id: conversationModel
        ListElement { sender: "user"; text: "What courses are available?" }
        ListElement { sender: "assistant"; text: "We offer B.Tech, MBA, BBA, and various certification programs." }
    }
}
