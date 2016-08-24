import QtQuick 2.4
import Ubuntu.Components 1.3

Overlay {
    property string wrongSolution: ""
    property string rightSolution: ""
    property int correctSolutionCount: 0
    property int overallSolutionCount: 0

    property var motivativeSlogans: [
        i18n.tr("Nevermind, moving on!"),
        i18n.tr("Don't worry!"),
        i18n.tr("Keep your head up!"),
        i18n.tr("Hold your head up!"),
        i18n.tr("Go on!")
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
            text: i18n.tr("Failure")
            fontSize: "x-large"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("%1/%2 correct").arg(correctSolutionCount).arg(overallSolutionCount)
            fontSize: "medium"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("<b>Your solution</b>: %1").arg(wrongSolution)
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("<b>Correct solution</b>: %1").arg(rightSolution)
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

        text: i18n.tr("Tap anywhere to continue")
    }
}
