import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Gallery Page
  Showcases campus photos and videos
*/

Rectangle {
    id: galleryPage
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
                        text: "Campus Gallery"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Explore our beautiful campus"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Filter Buttons
            RowLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 10
                spacing: 10
                
                Button {
                    text: "All"
                    background: Rectangle {
                        color: "#003DA5"
                        radius: 4
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font.pixelSize: 12
                    }
                }
                
                Button {
                    text: "Events"
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
                }
                
                Button {
                    text: "Campus"
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
                }
                
                Button {
                    text: "Activities"
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
                }
                
                Item { Layout.fillWidth: true }
            }
            
            // Gallery Grid
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 0
                columns: 3
                columnSpacing: 15
                rowSpacing: 15
                
                Repeater {
                    model: 9
                    delegate: GalleryItem {
                        imageId: index + 1
                    }
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
