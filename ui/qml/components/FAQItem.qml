import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
  FAQ Item Component
  Expandable FAQ section
*/

Rectangle {
    id: faqItem
    width: parent.width
    height: expanded ? (questionText.implicitHeight + answerText.implicitHeight + 40) : 60
    color: "#F5F5F5"
    radius: 8
    border.color: "#E0E0E0"
    border.width: 1
    
    property string question: "Question?"
    property string answer: "Answer goes here."
    property bool expanded: false
    
    Behavior on height {
        NumberAnimation { duration: 300; easing.type: Easing.OutQuad }
    }
    
    MouseArea {
        anchors {
            fill: parent
            margins: 0
        }
        onClicked: faqItem.expanded = !faqItem.expanded
    }
    
    ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 10
        clip: true
        
        RowLayout {
            spacing: 10
            
            Text {
                id: questionText
                text: question
                color: "#003DA5"
                font.pixelSize: 13
                font.bold: true
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            Text {
                text: expanded ? "−" : "+"
                color: "#F4B860"
                font.pixelSize: 18
                font.bold: true
            }
        }
        
        Text {
            id: answerText
            text: answer
            color: "#666666"
            font.pixelSize: 12
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            visible: expanded
            opacity: expanded ? 1 : 0
            
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
