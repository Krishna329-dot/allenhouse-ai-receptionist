import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

/*
  Home Page Component
  Landing page with welcome banner, quick access cards, and highlights
*/

Rectangle {
    id: homePage
    color: "#FFFFFF"
    
    signal discoverButtonClicked()
    
    Flickable {
        anchors.fill: parent
        contentHeight: mainColumn.implicitHeight
        clip: true
        
        ColumnLayout {
            id: mainColumn
            width: parent.width
            spacing: 20
            
            // Welcome Banner
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 300
                color: "#003DA5"
                radius: 12
                Layout.margins: 20
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 30
                    }
                    spacing: 15
                    
                    Text {
                        text: "WELCOME TO ALLENHOUSE"
                        color: "#F4B860"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Empowering Minds. Shaping Tomorrow."
                        color: "#FFFFFF"
                        font.pixelSize: 18
                        font.bold: true
                    }
                    
                    Text {
                        text: "A Place to Learn, A Space to Grow."
                        color: "#E0E0E0"
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                    
                    Item { Layout.fillHeight: true }
                    
                    RowLayout {
                        spacing: 15
                        
                        Button {
                            text: "Discover Allenhouse"
                            background: Rectangle {
                                color: "#F4B860"
                                radius: 6
                            }
                            contentItem: RowLayout {
                                spacing: 8
                                anchors.centerIn: parent
                                
                                Text {
                                    text: parent.parent.text
                                    color: "#003DA5"
                                    font.pixelSize: 13
                                    font.bold: true
                                }
                                
                                Text {
                                    text: "→"
                                    color: "#003DA5"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                            }
                            onClicked: homePage.discoverButtonClicked()
                        }
                        
                        Button {
                            text: "Explore Campus"
                            background: Rectangle {
                                color: "transparent"
                                border.color: "#F4B860"
                                border.width: 2
                                radius: 6
                            }
                            contentItem: Text {
                                text: parent.parent.text
                                color: "#F4B860"
                                font.pixelSize: 13
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                            }
                            onClicked: console.log("Explore campus clicked")
                        }
                    }
                }
            }
            
            // Quick Access Cards
            Text {
                text: "Quick Access"
                color: "#1A1A1A"
                font.pixelSize: 18
                font.bold: true
                Layout.margins: 20
                Layout.topMargin: 10
            }
            
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 0
                columns: 4
                rowSpacing: 15
                columnSpacing: 15
                
                QuickAccessCard { title: "Admissions"; icon: "admission"; color: "#E3F2FD" }
                QuickAccessCard { title: "Courses"; icon: "courses"; color: "#F3E5F5" }
                QuickAccessCard { title: "Fees"; icon: "fees"; color: "#E8F5E9" }
                QuickAccessCard { title: "Scholarships"; icon: "scholarship"; color: "#FFF3E0" }
                QuickAccessCard { title: "Placements"; icon: "placement"; color: "#FCE4EC" }
                QuickAccessCard { title: "Hostel"; icon: "hostel"; color: "#E0F2F1" }
                QuickAccessCard { title: "Library"; icon: "library"; color: "#F1F8E9" }
                QuickAccessCard { title: "Contact"; icon: "contact"; color: "#EFEBE9" }
            }
            
            // College Highlights
            Text {
                text: "College Highlights"
                color: "#1A1A1A"
                font.pixelSize: 18
                font.bold: true
                Layout.margins: 20
                Layout.topMargin: 10
            }
            
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 0
                columns: 4
                rowSpacing: 15
                columnSpacing: 15
                
                HighlightCard {
                    number: "3500+"
                    title: "Students"
                    icon: "students"
                }
                
                HighlightCard {
                    number: "50+"
                    title: "Courses"
                    icon: "courses"
                }
                
                HighlightCard {
                    number: "200+"
                    title: "Faculty"
                    icon: "faculty"
                }
                
                HighlightCard {
                    number: "300+"
                    title: "Recruiters"
                    icon: "recruiters"
                }
            }
            
            // Today's Quote
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 150
                Layout.margins: 20
                color: "#FFF9C4"
                radius: 8
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    spacing: 10
                    
                    Text {
                        text: "Today's Quote"
                        color: "#F57F17"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    
                    Text {
                        text: "\"The future depends on what you do today.\""
                        color: "#1A1A1A"
                        font.pixelSize: 16
                        font.italic: true
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                    
                    Text {
                        text: "— Mahatma Gandhi"
                        color: "#666666"
                        font.pixelSize: 12
                    }
                    
                    Item { Layout.fillHeight: true }
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
