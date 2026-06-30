import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Explore/Discover Page
  Shows detailed information about Allenhouse
*/

Rectangle {
    id: explorePage
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
                Layout.preferredHeight: 250
                color: "#001F5C"
                Layout.margins: 0
                
                Image {
                    anchors.fill: parent
                    source: "../assets/images/campus.jpg"
                    fillMode: Image.PreserveAspectCrop
                    opacity: 0.7
                }
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 40
                    }
                    
                    Text {
                        text: "Discover Allenhouse"
                        color: "#FFFFFF"
                        font.pixelSize: 36
                        font.bold: true
                    }
                    
                    Text {
                        text: "Premier Institution for Excellence in Education"
                        color: "#F4B860"
                        font.pixelSize: 16
                    }
                    
                    Item { Layout.fillHeight: true }
                }
            }
            
            // About Section
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 30
                spacing: 15
                
                Text {
                    text: "About Allenhouse"
                    color: "#003DA5"
                    font.pixelSize: 22
                    font.bold: true
                }
                
                Text {
                    text: "Allenhouse Group of Institutions is a premier educational institution committed to empowering minds and shaping tomorrow's leaders. With state-of-the-art facilities, experienced faculty, and industry-focused curriculum, we provide comprehensive education across multiple disciplines."
                    color: "#444444"
                    font.pixelSize: 13
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    lineHeight: 1.6
                }
            }
            
            // Features Grid
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 30
                Layout.topMargin: 0
                columns: 3
                columnSpacing: 20
                rowSpacing: 20
                
                FeatureCard {
                    title: "World-Class Faculty"
                    description: "Experienced educators with industry expertise"
                    icon: "faculty"
                }
                
                FeatureCard {
                    title: "Modern Infrastructure"
                    description: "State-of-the-art labs and facilities"
                    icon: "infrastructure"
                }
                
                FeatureCard {
                    title: "Industry Partnerships"
                    description: "Strong ties with leading companies"
                    icon: "partnership"
                }
                
                FeatureCard {
                    title: "Research Focus"
                    description: "Opportunities for innovation and research"
                    icon: "research"
                }
                
                FeatureCard {
                    title: "Global Exposure"
                    description: "International exchange programs"
                    icon: "global"
                }
                
                FeatureCard {
                    title: "Placement Support"
                    description: "Excellent placement track record"
                    icon: "placement"
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
