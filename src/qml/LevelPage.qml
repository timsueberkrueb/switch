import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "."


Page {
    id: levelPage
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

    function matrixSolved() {
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

    header: matrixWidget.isRowSelected ? multiplyHeader : normalHeader

    MatrixHeader {
        id: normalHeader
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

    MultiplyHeader {
        id: multiplyHeader
        matrixWidget: matrixWidget
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
            anchors.horizontalCenter: parent.horizontalCenter
            y: units.dp(16)
            onSolved: matrixSolved()
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
                        matrixSolved();
                    }
                    onFailed: {
                        failureOverlay.wrongSolution = solutionToString(wrongSolution);
                        failureOverlay.rightSolution = solutionToString(rightSolution);
                        failureOverlay.correctSolutionCount = correctSolutionCount;
                        failureOverlay.overallSolutionCount = rightSolution.length;
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
        solution: solutionToString(solveWidget.solution)
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
        var solution = Matrix.randomSolution(level.solutionCount, level.solutionMin, level.solutionMax);
        var matrix = Matrix.randomMatrix(solution, level.multiplierMax);
        console.log("Generated solution: " + JSON.stringify(solution))
        console.log("Generated matrix: " + JSON.stringify(matrix))
        matrixWidget.matrix = matrix;
        solveWidget.setSolution(solution);
    }
}
