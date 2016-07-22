pragma Singleton
import QtQuick 2.4
import Qt.labs.settings 1.0

QtObject {
    id: game

    property ListModel levelModel: LevelModel {}

    property int score: 0
    property bool firstStart: true

    property QtObject statistics: QtObject {
        id: statistics
        property int failureCount: 0
        property int successCount: 0
        property int surrenderCount: 0

        property var settings: Settings {
            category: "statistics"
            property alias failureCount: statistics.failureCount
            property alias successCount: statistics.successCount
            property alias surrenderCount: statistics.surrenderCount
        }
    }

    property var settings: Settings {
        category: "main"
        property alias score: game.score
        property alias firstStart: game.firstStart
    }
}
