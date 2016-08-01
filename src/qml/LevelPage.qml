import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "."


Page {
    property var level
    signal completed()
    signal surrendered()

    function solutionToString(solution) {
        var str = ""
        for (var i=0; i<solution.length; i++) {
            str += "x" + (i+1).toString() + "=" + solution[i].toString()
            if (i !== solution.length-1)
                str += ", "
        }
        return str
    }

    header: MatrixHeader {
        title: "Level '%1'".arg(level.title)
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                text: "Back"
                onTriggered: {
                    Game.statistics.surrenderCount++;
                    surrendered();
                }
            }
        ]
        contents: RowLayout {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Label {
                text: header.title
                color: "white"
                fontSize: "large"
            }

            Item {
                Layout.fillWidth: true
                height: 1
            }

            StarsLabel {
                levelIndex: level.index
                color: "white"
            }
        }
    }

    Item {
        id: contentItem
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        MatrixWidget {
            id: matrixWidget
            y: units.dp(16)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: bottomPanel
            property bool solving: false

            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            height: col.height + 32
            width: parent.width
            color: themeColorLight

            Column {
                id: col
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                Button {
                    visible: !bottomPanel.solving
                    text: "Solve"
                    color: accentColor
                    onClicked: bottomPanel.solving = true
                }

                SolveWidget {
                    id: solveWidget
                    visible: bottomPanel.solving
                    onSolved: {
                        Game.statistics.successCount++;
                        if (level.index === Game.currentLevelIndex && Game.currentStars < 5)
                            Game.currentStars++;
                        if (level.index === Game.currentLevelIndex && Game.currentStars === 5
                            && Game.currentLevelIndex === Game.levelModel.count - 1) {
                            gameCompletedOverlay.show();
                        }
                        else {
                            successOverlay.show();
                        }
                    }
                    onFailed: {
                        failureOverlay.wrongSolution = solutionToString(wrongSolutions);
                        failureOverlay.rightSolution = solutionToString(rightSolutions);
                        failureOverlay.correctSolutionsCount = correctSolutionsCount;
                        failureOverlay.overallSolutionsCount = rightSolutions.length;
                        failureOverlay.show();
                        Game.statistics.failureCount++;
                    }
                    onHideRequested: {
                        bottomPanel.solving = false;
                    }
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    SuccessOverlay {
        id: successOverlay
        anchors.fill: parent
        levelIndex: level.index
        levelName: level.title
        onClicked: {
            hide();
            completed();
        }
    }

    FailureOverlay {
        id: failureOverlay
        anchors.fill: parent
        wrongSolution: ""
        rightSolution: ""
        onClicked: {
            hide();
            completed();
        }
    }

    GameCompletedOverlay {
        id: gameCompletedOverlay
        anchors.fill: parent
        onClicked: {
            hide();
            completed();
        }
    }

    Component.onCompleted: {
        var solutions = Matrix.randomSolutions(level.solutionsCount, level.solutionsMin, level.solutionsMax);
        var matrix = Matrix.randomMatrix(solutions, level.multiplierMax);
        console.log("Generated solutions: " + JSON.stringify(solutions))
        console.log("Generated matrix: " + JSON.stringify(matrix))
        matrixWidget.matrix = matrix;
        solveWidget.setSolutions(solutions);
    }
}
