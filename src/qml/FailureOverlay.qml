import QtQuick 2.4
import Ubuntu.Components 1.3

Overlay {
    property string wrongSolution: ""
    property string rightSolution: ""
    property int correctSolutionsCount: 0
    property int overallSolutionsCount: 0

    property var motivativeSlogans: [
        "Nevermind, moving on!",
        "Don't worry!",
        "Keep your head up!",
        "Hold your head up!",
        "Go on!"
    ]

    color: warningColorLight

    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: units.dp(8)

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Failure"
            fontSize: "x-large"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "%1/%2 solutions correct".arg(correctSolutionsCount).arg(overallSolutionsCount)
            fontSize: "medium"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "<b>Your solution</b>: %1".arg(wrongSolution)
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "<b>Correct solution</b>: %1".arg(rightSolution)
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: motivativeSlogans[Math.floor(Math.random()*motivativeSlogans.length)]
        }
    }

    Label {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: units.dp(16)
        }

        text: "Tap anywhere to continue"
    }
}
