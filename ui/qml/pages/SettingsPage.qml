import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Settings Page
  Application preferences and configurations
*/

Rectangle {
    id: settingsPage
    color: "#FFFFFF"
    
    signal themeChanged(string theme)
    
    Flickable {
        anchors.fill: parent
        contentHeight: mainColumn.implicitHeight
        clip: true
        
        ColumnLayout {
            id: mainColumn
            width: parent.width
            spacing: 20
            
            // Header
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "#003DA5"
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    
                    Text {
                        text: "Settings"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Configure your preferences"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Display Settings
            SettingsSection {
                title: "Display"
                
                SettingItem {
                    label: "Theme"
                    description: "Choose light or dark theme"
                    
                    RowLayout {
                        spacing: 10
                        
                        Button {
                            text: "Light"
                            background: Rectangle {
                                color: "#F5F5F5"
                                border.color: "#E0E0E0"
                                border.width: 1
                                radius: 4
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#666666"
                                font.pixelSize: 12
                            }
                            onClicked: settingsPage.themeChanged("light")
                        }
                        
                        Button {
                            text: "Dark"
                            background: Rectangle {
                                color: "#333333"
                                radius: 4
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                font.pixelSize: 12
                            }
                            onClicked: settingsPage.themeChanged("dark")
                        }
                    }
                }
                
                SettingItem {
                    label: "Font Size"
                    description: "Adjust text size"
                    
                    RowLayout {
                        spacing: 10
                        
                        Button { text: "A-"; width: 40; height: 40 }
                        Slider { Layout.preferredWidth: 100; from: 10; to: 18; value: 14 }
                        Button { text: "A+"; width: 40; height: 40 }
                    }
                }
            }
            
            // Sound Settings
            SettingsSection {
                title: "Sound & Notifications"
                
                SettingItem {
                    label: "Volume"
                    description: "Adjust speaker volume"
                    
                    Slider {
                        Layout.preferredWidth: 200
                        from: 0
                        to: 100
                        value: 80
                    }
                }
                
                SettingItem {
                    label: "Notifications"
                    description: "Enable/disable notifications"
                    
                    Switch {
                        checked: true
                    }
                }
            }
            
            // Language Settings
            SettingsSection {
                title: "Language"
                
                SettingItem {
                    label: "Preferred Language"
                    description: "Choose application language"
                    
                    ComboBox {
                        Layout.preferredWidth: 200
                        model: ["English", "हिन्दी"]
                    }
                }
            }
            
            // About Section
            SettingsSection {
                title: "About"
                
                SettingItem {
                    label: "Version"
                    description: "Application version"
                    
                    Text {
                        text: "v1.0.0"
                        color: "#888888"
                        font.pixelSize: 12
                    }
                }
                
                SettingItem {
                    label: "Developer"
                    description: "Application developer"
                    
                    Text {
                        text: "Allenhouse Group"
                        color: "#888888"
                        font.pixelSize: 12
                    }
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
