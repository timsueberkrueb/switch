import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Overlay {
    id: completedOverlay

    color: "white"
    mouseAreaEnabled: false

    Row {
        id: row
        anchors {
            top: parent.top
            left: parent.left
            margins: units.dp(8)
        }

        spacing: units.dp(8)

        Icon {
            anchors.verticalCenter: parent.verticalCenter
            name: "back"
            color: theme.palette.normal.foregroundText
            height: units.dp(16)
            width: height
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: i18n.tr("Back to game")
            fontSize: "large"
        }
    }

    MouseArea {
        anchors.fill: row
        onClicked: completedOverlay.clicked()
    }

    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: units.dp(8)

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("You made it!")
            fontSize: "x-large"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Thanks so much for playing.")
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("★ %1").arg("Rate")
            color: UbuntuColors.green
            onClicked: {
                Qt.openUrlExternally("scope://com.canonical.scopes.clickstore?q=Switch by Tim Süberkrüb")
            }
        }
    }
}
