import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Page {
    visible: false

    header: MatrixHeader {
        title: "Stats"
    }

    Column {
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: units.dp(16)
        }

        spacing: units.dp(8)

        Label {
            text: "Score: %1".arg(Game.score)
            fontSize: "x-large"
        }

        Label {
            text: "Matrices solved: %1".arg(Game.statistics.successCount)
        }

        Label {
            text: "Failure count: %1".arg(Game.statistics.failureCount)
        }

        Label {
            text: "Success rate: %1%".arg(Math.round(Game.statistics.successCount/(Game.statistics.failureCount+Game.statistics.successCount)*100))
        }
    }
}

