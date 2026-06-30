import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Sidebar Component
  Navigation menu with icons and hover animations
*/

Rectangle {
    id: sidebar
    color: "#003DA5"
    
    signal navigateTo(string page)
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 0
        }
        spacing: 0
        
        // Logo Section
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "#001F5C"
            
            RowLayout {
                anchors {
                    fill: parent
                    margins: 15
                }
                spacing: 10
                
                Image {
                    source: "../assets/images/logo.png"
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
        
        // Navigation Items
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: navItems
            
            delegate: SidebarItem {
                width: sidebar.width
                itemText: modelData.name
                itemIcon: modelData.icon
                itemPage: modelData.page
                isActive: sidebar.currentPage === modelData.page
                
                onClicked: {
                    sidebar.currentPage = itemPage
                    sidebar.navigateTo(itemPage)
                }
            }
        }
        
        Item { Layout.fillHeight: true }
        
        // Help Section
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "#F4B860"
            
            ColumnLayout {
                anchors {
                    fill: parent
                    margins: 10
                }
                spacing: 5
                
                Text {
                    text: "Talk to Us"
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Voice Assistant"
                    color: "#333333"
                    font.pixelSize: 11
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Tap the mic and ask"
                    color: "#555555"
                    font.pixelSize: 10
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
    
    property string currentPage: "home"
    
    ListModel {
        id: navItems
        
        ListElement { name: "Home"; icon: "home"; page: "home" }
        ListElement { name: "Assistant"; icon: "assistant"; page: "assistant" }
        ListElement { name: "Campus Map"; icon: "map"; page: "map" }
        ListElement { name: "Admissions"; icon: "admission"; page: "admissions" }
        ListElement { name: "Departments"; icon: "department"; page: "departments" }
        ListElement { name: "Events"; icon: "events"; page: "events" }
        ListElement { name: "Placements"; icon: "placement"; page: "placements" }
        ListElement { name: "Gallery"; icon: "gallery"; page: "gallery" }
        ListElement { name: "Help"; icon: "help"; page: "help" }
        ListElement { name: "Settings"; icon: "settings"; page: "settings" }
    }
}
