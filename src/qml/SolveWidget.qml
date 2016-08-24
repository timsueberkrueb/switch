import QtQuick 2.4
import QtQuick.Layouts 1.0
import Ubuntu.Components 1.3

Item {
    id: solveWidget
    property var solution
    property var inputSolution: []
    property int padding: 16
    property bool hideButtonVisible: true

    function setSolution(solution) {
        solveWidget.solution = solution;
        inputSolution = [];
        for (var i=0; i<solution.length; i++) {
            inputSolution.push(0);
        }
    }

    signal solved(var solution)
    signal failed(var wrongSolution, var rightSolution, var correctSolutionCount)
    signal hideRequested()

    width: childrenRect.width + padding * 2
    height: childrenRect.height + padding * 2

    ColumnLayout {
        x: padding
        y: padding
        spacing: units.dp(8)

        Label {
            text: i18n.tr("Solve")
            fontSize: "large"
        }

        Column {
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: units.dp(8)

            Repeater {
                id: repInput
                model: solution
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
                            inputSolution[index] = parseInt(text == "" ? 0 : text);
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
                text: i18n.tr("Solve")
                color: accentColor
                onClicked: {
                    var success = true;
                    var correctSolution = 0;
                    for (var i=0; i<solution.length; i++) {
                        if (inputSolution[i] !== solution[i]) {
                            success = false;
                            break;
                        }
                        else {
                            correctSolution++;
                        }
                    }
                    if (success)
                        solved(solution);
                    else
                        failed(inputSolution, solution, correctSolution);
                }
            }

            Button {
                visible: hideButtonVisible
                text: i18n.tr("Hide")
                color: themeColor
                onClicked: {
                    hideRequested();
                }
            }
        }
    }
}
