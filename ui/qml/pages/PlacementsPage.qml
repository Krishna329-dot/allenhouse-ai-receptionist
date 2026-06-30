import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  Placements Page
  Shows recruitment and placement information
*/

Rectangle {
    id: placementsPage
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
                        text: "Placements & Recruitment"
                        color: "#FFFFFF"
                        font.pixelSize: 24
                        font.bold: true
                    }
                    
                    Text {
                        text: "Build your future with us"
                        color: "#F4B860"
                        font.pixelSize: 13
                    }
                }
            }
            
            // Placement Stats
            GridLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                columns: 4
                columnSpacing: 15
                rowSpacing: 15
                
                PlacementStatCard {
                    number: "98%"
                    label: "Placement Rate"
                }
                
                PlacementStatCard {
                    number: "300+"
                    label: "Recruiters"
                }
                
                PlacementStatCard {
                    number: "12 LPA"
                    label: "Avg Package"
                }
                
                PlacementStatCard {
                    number: "25 LPA"
                    label: "Highest Package"
                }
            }
            
            // Companies Section
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 0
                spacing: 15
                
                Text {
                    text: "Our Recruiters"
                    color: "#003DA5"
                    font.pixelSize: 18
                    font.bold: true
                }
                
                GridLayout {
                    Layout.fillWidth: true
                    columns: 5
                    columnSpacing: 15
                    rowSpacing: 15
                    
                    Repeater {
                        model: companyNames
                        delegate: CompanyLogo {
                            companyName: modelData
                        }
                    }
                }
            }
            
            // Placement Process
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 15
                
                Text {
                    text: "Placement Process"
                    color: "#003DA5"
                    font.pixelSize: 18
                    font.bold: true
                }
                
                ProcessStep {
                    stepNumber: 1
                    stepTitle: "Registration"
                    stepDescription: "Register with the placement office with your resume"
                }
                
                ProcessStep {
                    stepNumber: 2
                    stepTitle: "Company Visits"
                    stepDescription: "Companies visit campus for recruitment drives"
                }
                
                ProcessStep {
                    stepNumber: 3
                    stepTitle: "Selection"
                    stepDescription: "Written test, technical, and HR rounds"
                }
                
                ProcessStep {
                    stepNumber: 4
                    stepTitle: "Offer"
                    stepDescription: "Receive offer letters from selected companies"
                }
            }
            
            Item { Layout.preferredHeight: 20 }
        }
    }
    
    ListModel {
        id: companyNames
        ListElement { name: "Google" }
        ListElement { name: "Microsoft" }
        ListElement { name: "Amazon" }
        ListElement { name: "IBM" }
        ListElement { name: "TCS" }
        ListElement { name: "Infosys" }
        ListElement { name: "Accenture" }
        ListElement { name: "Wipro" }
        ListElement { name: "HCL" }
        ListElement { name: "Cognizant" }
    }
}
