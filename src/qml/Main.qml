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
        LevelPage {

        }
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
            push(mainPage);
            if (Game.firstStart) {
                push(tutorialPage);
                Game.firstStart = false;
            }
        }
    }
}
