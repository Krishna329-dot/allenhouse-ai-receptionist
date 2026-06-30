import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Help/Support Page
  FAQs and support information
*/

Rectangle {
    id: helpPage
    color: "#FFFFFF"
    
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
                        text: "Help & Support"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Find answers to your questions"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Quick Support
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 15
                
                Text {
                    text: "Quick Support"
                    color: "#003DA5"
                    font.pixelSize: 16
                    font.bold: true
                }
                
                RowLayout {
                    spacing: 15
                    
                    Button {
                        text: "Call"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            color: "#4CAF50"
                            radius: 6
                        }
                        contentItem: RowLayout {
                            spacing: 8
                            anchors.centerIn: parent
                            
                            Text { text: "📞" }
                            Text {
                                text: parent.parent.text
                                color: "white"
                                font.bold: true
                            }
                        }
                    }
                    
                    Button {
                        text: "Email"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            color: "#2196F3"
                            radius: 6
                        }
                        contentItem: RowLayout {
                            spacing: 8
                            anchors.centerIn: parent
                            
                            Text { text: "📧" }
                            Text {
                                text: parent.parent.text
                                color: "white"
                                font.bold: true
                            }
                        }
                    }
                    
                    Button {
                        text: "Chat"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            color: "#FF9800"
                            radius: 6
                        }
                        contentItem: RowLayout {
                            spacing: 8
                            anchors.centerIn: parent
                            
                            Text { text: "💬" }
                            Text {
                                text: parent.parent.text
                                color: "white"
                                font.bold: true
                            }
                        }
                    }
                    
                    Item { Layout.fillWidth: true }
                }
            }
            
            // FAQs
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 0
                spacing: 10
                
                Text {
                    text: "Frequently Asked Questions"
                    color: "#003DA5"
                    font.pixelSize: 16
                    font.bold: true
                }
                
                FAQItem {
                    question: "How do I apply for admission?"
                    answer: "You can apply online through our admission portal. Visit the Admissions section for detailed instructions."
                }
                
                FAQItem {
                    question: "What are the eligibility criteria?"
                    answer: "Eligibility varies by course. Generally, 12th pass is required for UG programs. Check specific course requirements."
                }
                
                FAQItem {
                    question: "When are placements conducted?"
                    answer: "Placements are conducted annually, typically starting in January. Top companies visit our campus."
                }
                
                FAQItem {
                    question: "Is hostel facility available?"
                    answer: "Yes, we have both boys and girls hostels with modern amenities available for students."
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
