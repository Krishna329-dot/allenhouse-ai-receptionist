import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Header Component
  Displays: Logo, Time, Date, Weather, Language, Notifications, Profile
*/

Rectangle {
    id: header
    color: "#FFFFFF"
    border.color: "#E0E0E0"
    border.width: 1
    
    property int notificationCount: 0
    signal languageChanged(string language)
    signal notificationClicked()
    
    RowLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 20
        
        // Logo and Title
        RowLayout {
            Layout.preferredWidth: 300
            spacing: 10
            
            Image {
                source: "../assets/images/logo.png"
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                fillMode: Image.PreserveAspectFit
            }
            
            Column {
                Layout.fillWidth: true
                spacing: 2
                
                Text {
                    text: "Allenhouse"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#003DA5"
                }
                
                Text {
                    text: "Group of Institutions"
                    font.pixelSize: 10
                    color: "#888888"
                }
            }
        }
        
        Item { Layout.fillWidth: true }
        
        // Time and Weather
        RowLayout {
            spacing: 30
            
            // Time
            RowLayout {
                spacing: 10
                
                Image {
                    source: "../assets/icons/clock.svg"
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                Column {
                    spacing: 2
                    
                    Text {
                        id: timeDisplay
                        text: "09:45 AM"
                        font.pixelSize: 14
                        font.bold: true
                        color: "#1A1A1A"
                    }
                    
                    Text {
                        id: dateDisplay
                        text: "Monday, 20 May 2024"
                        font.pixelSize: 10
                        color: "#888888"
                    }
                }
            }
            
            // Weather
            RowLayout {
                spacing: 10
                
                Image {
                    source: "../assets/icons/weather-cloudy.svg"
                    Layout.preferredWidth: 32
                    Layout.preferredHeight: 32
                }
                
                Column {
                    spacing: 2
                    
                    Text {
                        text: "32°C"
                        font.pixelSize: 14
                        font.bold: true
                        color: "#1A1A1A"
                    }
                    
                    Text {
                        text: "Partly Cloudy"
                        font.pixelSize: 10
                        color: "#888888"
                    }
                }
                
                Text {
                    text: "Lucknow, UP"
                    font.pixelSize: 10
                    color: "#888888"
                }
            }
        }
        
        // Language Switch
        Row {
            spacing: 5
            
            Button {
                text: "English"
                background: Rectangle {
                    color: header.currentLanguage === "en" ? "#003DA5" : "#F5F5F5"
                    border.color: "#E0E0E0"
                    border.width: 1
                    radius: 4
                }
                contentItem: Text {
                    text: parent.text
                    color: header.currentLanguage === "en" ? "white" : "#1A1A1A"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 12
                }
                onClicked: {
                    header.currentLanguage = "en"
                    languageChanged("en")
                }
            }
            
            Button {
                text: "हिंदी"
                background: Rectangle {
                    color: header.currentLanguage === "hi" ? "#003DA5" : "#F5F5F5"
                    border.color: "#E0E0E0"
                    border.width: 1
                    radius: 4
                }
                contentItem: Text {
                    text: parent.text
                    color: header.currentLanguage === "hi" ? "white" : "#1A1A1A"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 12
                }
                onClicked: {
                    header.currentLanguage = "hi"
                    languageChanged("hi")
                }
            }
        }
        
        property string currentLanguage: "en"
        
        // Notification Icon
        Button {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            
            background: Rectangle {
                color: "transparent"
            }
            
            contentItem: RowLayout {
                Image {
                    source: "../assets/icons/notification.svg"
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                Rectangle {
                    visible: notificationCount > 0
                    width: 20
                    height: 20
                    radius: 10
                    color: "#F44336"
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                    
                    Text {
                        anchors.centerIn: parent
                        text: notificationCount.toString()
                        color: "white"
                        font.pixelSize: 12
                        font.bold: true
                    }
                }
            }
            
            onClicked: notificationClicked()
        }
        
        // Profile Icon
        Button {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            
            background: Rectangle {
                color: "transparent"
            }
            
            contentItem: Image {
                source: "../assets/icons/profile.svg"
                fillMode: Image.PreserveAspectFit
            }
            
            onClicked: console.log("Profile clicked")
        }
    }
}
