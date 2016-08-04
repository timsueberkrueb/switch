import QtQuick 2.4
import Ubuntu.Components 1.3
import "."


MainView {
    implicitWidth: 640
    implicitHeight: 480

    objectName: "mainView"
    applicationName: "switch.timsueberkrueb"
    anchorToKeyboard: true

    Component {
        id: levelPageComponent
        LevelPage {}
    }

    PageStack {
        id: pageStack
        anchors.fill: parent

        MainPage {
            id: mainPage
            onLevelSelected: {
                var page = pageStack.push(levelPageComponent, {
                    level: level
                });
                page.completed.connect(function(){
                    pageStack.pop(page);
                    if (Game.currentStars < 5)
                        levelSelected(level);
                    else if (Game.currentLevelIndex < Game.levelModel.count - 1 && level.index === Game.currentLevelIndex) {
                        Game.currentStars = 0;
                        Game.currentLevelIndex++;
                    }
                });
                page.surrendered.connect(function(){
                    Game.statistics.surrenderCount++;
                    pageStack.pop(page);
                });
            }
        }

        StatsPage {
            id: statsPage
        }

        HelpPage {
            id: helpPage
        }

        AboutPage {
            id: aboutPage
        }

        TutorialPage {
            id: tutorialPage
        }

        Component.onCompleted: {
            // Load settings
            Game.saves.load();
            if (typeof Game.saves.matrices.length === 0) {
                Game.saves.matrices = new Array(Game.levelModel.length);
                Game.saves.solutions = new Array(Game.levelModel.length);
            }

            // Prepare UI
            push(mainPage);
            if (Game.firstStart) {
                push(tutorialPage);
                Game.firstStart = false;
            }
        }

        Component.onDestruction: {
            // Save settings
            Game.saves.save();
        }
    }
}
