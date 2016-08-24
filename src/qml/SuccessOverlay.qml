import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Overlay {
    id: successOverlay

    property string levelName
    property int levelIndex
    property string solution

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
            text: i18n.tr("Success")
            fontSize: "x-large"
            color: "white"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Matrix solved.")
            color: "white"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Solution: %1").arg(solution)
            color: "white"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            visible: levelIndex === Game.currentLevelIndex && Game.currentStars < 5
            text: i18n.tr("Solve %1 more to complete the level.").arg(5 - Game.currentStars)
            color: "white"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            visible: levelIndex === Game.currentLevelIndex && Game.currentStars === 5
                     && Game.currentLevelIndex < Game.levelModel.count - 1
            text: i18n.tr("<b>Level '%1' unlocked.</b>").arg(visible ? Game.levelModel.get(Game.currentLevelIndex+1).title : "")
            color: "white"
        }
    }

    Label {
        anchors {
            top: parent.top
            left: parent.left
            margins: units.dp(16)
        }
        text: levelName
        color: "white"
        fontSize: "large"
    }

    StarsLabel {
        anchors {
            top: parent.top
            right: parent.right
            margins: units.dp(16)
        }
        levelIndex: successOverlay.levelIndex
        color: "white"
        fontSize: "large"
    }

    Label {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: units.dp(16)
        }
        text: i18n.tr("Tap anywhere to continue")
        color: "white"
    }
}
