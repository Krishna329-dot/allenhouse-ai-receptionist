import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Admissions Page
  Information about admission process and requirements
*/

Rectangle {
    id: admissionsPage
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
                Layout.preferredHeight: 100
                color: "#003DA5"
                
                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    
                    Text {
                        text: "Admissions 2024-25"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Apply now for UG/PG programs"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Key Information
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                columns: 2
                columnSpacing: 20
                rowSpacing: 20
                
                AdmissionInfoCard {
                    title: "Application"
                    items: ["Online application portal", "Documents upload", "Application fee: ₹500"]
                }
                
                AdmissionInfoCard {
                    title: "Eligibility"
                    items: ["12th pass minimum", "Subject requirements vary", "Age limit: 18-30 years"]
                }
                
                AdmissionInfoCard {
                    title: "Important Dates"
                    items: ["Application deadline: 31 May 2024", "Merit list: 10 June 2024", "Counselling: 15-20 June 2024"]
                }
                
                AdmissionInfoCard {
                    title: "Documents Required"
                    items: ["10th & 12th Mark sheets", "ID Proof", "Address Proof", "Photo"]
                }
            }
            
            // CTA Button
            Button {
                text: "Start Application"
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 45
                background: Rectangle {
                    color: "#F4B860"
                    radius: 6
                }
                contentItem: Text {
                    text: parent.text
                    color: "#003DA5"
                    font.pixelSize: 14
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
}
