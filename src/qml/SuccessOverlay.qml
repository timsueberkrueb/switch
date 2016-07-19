import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Overlay {
    color: themeColor

    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: units.dp(8)

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Success"
            fontSize: "x-large"
            color: "white"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Matrix solved."
            color: "white"
        }
    }

    Label {
        anchors {
            top: parent.top
            right: parent.right
            margins: units.dp(16)
        }
        text: "Score: %1".arg(Game.score)
        color: "white"
    }


    Label {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: units.dp(16)
        }
        text: "Tap anywhere to continue"
        color: "white"
    }
}
