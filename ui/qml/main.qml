import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

/*
  Main Application Window
  Root QML component for Allenhouse AI Receptionist
  
  Structure:
  - Header (time, weather, language, notifications)
  - Sidebar (navigation)
  - Main Content Area (pages)
  - Footer (system status)
*/

ApplicationWindow {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: "Allenhouse AI Receptionist"
    
    // Color scheme
    readonly property color primaryBlue: "#003DA5"
    readonly property color primaryDarkBlue: "#001F5C"
    readonly property color goldenAccent: "#F4B860"
    readonly property color whiteBg: "#FFFFFF"
    readonly property color lightGray: "#F5F5F5"
    readonly property color darkText: "#1A1A1A"
    readonly property color mediumText: "#444444"
    readonly property color lightText: "#888888"
    readonly property color borderLight: "#E0E0E0"
    readonly property color successGreen: "#4CAF50"
    readonly property color errorRed: "#F44336"
    readonly property color warningOrange: "#FF9800"
    readonly property color infoBlue: "#2196F3"
    
    // State management
    property string currentPage: "home"
    property string currentLanguage: "en"
    property int notificationCount: 0
    
    // Background
    background: Rectangle {
        color: root.whiteBg
    }
    
    // Main layout
    RowLayout {
        anchors.fill: parent
        spacing: 0
        
        // SIDEBAR
        Sidebar {
            id: sidebar
            Layout.fillHeight: true
            Layout.preferredWidth: 280
            onNavigateTo: (page) => {
                root.currentPage = page
                mainContent.currentIndex = getPageIndex(page)
            }
        }
        
        // MAIN CONTENT AREA
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            
            // HEADER
            Header {
                id: header
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                notificationCount: root.notificationCount
                onLanguageChanged: root.currentLanguage = language
                onNotificationClicked: notificationsPopup.open()
            }
            
            // CONTENT PAGES
            StackLayout {
                id: mainContent
                Layout.fillWidth: true
                Layout.fillHeight: true
                currentIndex: 0
                
                // Page 0: Home
                HomePage {
                    onDiscoverButtonClicked: {
                        root.currentPage = "explore"
                        mainContent.currentIndex = 1
                    }
                }
                
                // Page 1: Explore/Discover
                ExplorePage {}
                
                // Page 2: Campus Map
                CampusMapPage {}
                
                // Page 3: Assistant
                AssistantPage {}
                
                // Page 4: Admissions
                AdmissionsPage {}
                
                // Page 5: Departments
                DepartmentsPage {}
                
                // Page 6: Events
                EventsPage {}
                
                // Page 7: Placements
                PlacementsPage {}
                
                // Page 8: Gallery
                GalleryPage {}
                
                // Page 9: Settings
                SettingsPage {
                    onThemeChanged: root.updateTheme(theme)
                }
            }
            
            // FOOTER
            Footer {
                Layout.fillWidth: true
                Layout.preferredHeight: 60
            }
        }
    }
    
    // Helper function to get page index
    function getPageIndex(pageName: string): int {
        const pages = {
            "home": 0,
            "explore": 1,
            "map": 2,
            "assistant": 3,
            "admissions": 4,
            "departments": 5,
            "events": 6,
            "placements": 7,
            "gallery": 8,
            "settings": 9
        }
        return pages[pageName] ?? 0
    }
    
    function updateTheme(theme: string) {
        // Theme update logic here
        console.log("Theme changed to:", theme)
    }
}
