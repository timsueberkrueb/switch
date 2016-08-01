import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Label {
    property int levelIndex

    text: {
        if (levelIndex > Game.currentLevelIndex) {
            return "☆☆☆☆☆";
        }
        else if (levelIndex === Game.currentLevelIndex) {
            var text = "";
            for (var i=0; i<Game.currentStars; i++) {
                text += "★";
            }
            for (i=Game.currentStars; i<5; i++) {
                text += "☆";
            }
            return text;
        }
        else {
            return "★★★★★";
        }
    }
}
