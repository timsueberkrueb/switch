import QtQuick 2.4
import QtQuick.Layouts 1.0
import Ubuntu.Components 1.3

Item {
    id: solveWidget
    property var solutions
    property var inputSolutions: []
    property int padding: 16

    function setSolutions(solutions) {
        solveWidget.solutions = solutions;
        inputSolutions = [];
        for (var i=0; i<solutions.length; i++) {
            inputSolutions.push(0);
        }
    }

    signal solved(var solutions)
    signal failed(var wrongSolutions, var rightSolutions, var correctSolutionsCount)
    signal hideRequested()

    width: childrenRect.width + padding * 2
    height: childrenRect.height + padding * 2

    ColumnLayout {
        x: padding
        y: padding
        spacing: units.dp(8)

        Label {
            text: "Solve"
            fontSize: "large"
        }

        Column {
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: units.dp(8)

            Repeater {
                id: repInput
                model: solutions
                delegate: Row {
                    property alias textField: textField
                    spacing: units.dp(8)

                    Label {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "X%1:".arg(index+1)
                    }

                    TextField {
                        id: textField
                        anchors.verticalCenter: parent.verticalCenter
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                        validator: IntValidator {

                        }
                        onTextChanged: {
                            inputSolutions[index] = parseInt(text == "" ? 0 : text);
                        }
                        onAccepted: {
                            if (index !== repInput.model.length-1)
                                repInput.itemAt(index+1).textField.forceActiveFocus(Qt.TabFocusReason);
                            else
                                solveButton.clicked();
                        }
                    }
                }
            }
        }

        Row {
            spacing: units.dp(8)

            Button {
                id: solveButton
                text: "Solve"
                color: accentColor
                onClicked: {
                    var success = true;
                    var correctSolutions = 0;
                    for (var i=0; i<solutions.length; i++) {
                        if (inputSolutions[i] !== solutions[i]) {
                            success = false;
                            break;
                        }
                        else {
                            correctSolutions++;
                        }
                    }
                    if (success)
                        solved(solutions);
                    else
                        failed(inputSolutions, solutions, correctSolutions);
                }
            }

            Button {
                text: "Hide"
                color: themeColor
                onClicked: {
                    hideRequested();
                }
            }
        }
    }
}
