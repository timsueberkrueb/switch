pragma Singleton
import QtQuick 2.4
import Qt.labs.settings 1.0

QtObject {
    id: game

    property ListModel levelModel: LevelModel {}

    property bool firstStart: true
    property int currentLevelIndex: 0
    property int currentStars: 0

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
        property alias firstStart: game.firstStart
        property alias currentStars: game.currentStars
        property alias currentLevelIndex: game.currentLevelIndex
    }
}
