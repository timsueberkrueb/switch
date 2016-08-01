import QtQuick 2.4
import QtQuick.Layouts 1.0


Item {
    id: matrixWidget

    property var matrix
    property int padding: units.dp(32)

    signal solved()

    width: childrenRect.width + padding * 2
    height: childrenRect.height

    Row {
        x: padding
        y: padding
        spacing: units.dp(8)

        Item {
            width: childrenRect.width
            height: childrenRect.height
            anchors.verticalCenter: matrixContainer.verticalCenter

            Column {
                MultiplyActionField {
                    id: actionFieldMultiplyPositive
                    mode: postive
                    selectedRow: matrixContainer.selectedRow
                }

                MultiplyActionField {
                    id: actionFieldMultiplyNegative
                    mode: negative
                    selectedRow: matrixContainer.selectedRow
                }
            }
        }

        Item {
            id: matrixContainer
            width: matrixColumn.width
            height: matrixColumn.height

            property int selectedIndex: -1
            property var selectedRow

            function checkSolved() {
                var isSolved = true;
                for (var i=0; i<matrixRepeater.count; i++) {
                    var matrixRow = matrixRepeater.itemAt(i);
                    if (!matrixRow.isRowCanonicalForm) {
                        isSolved = false;
                        break;
                    }
                }
                if (isSolved)
                    matrixWidget.solved();
            }

            Column {
                id: matrixColumn
                spacing: units.dp(8)

                Repeater {
                    id: matrixRepeater
                    model: matrix;
                    delegate: MatrixRow {
                        id: matrixRow
                        rowModel: matrix[index]
                        isSelected: matrixContainer.selectedIndex == index;
                        onIsRowCanonicalFormChanged: {
                            matrixContainer.checkSolved();
                        }
                        onSelected: {
                            matrixContainer.selectedIndex = index;
                            matrixContainer.selectedRow = matrixRow;
                        }
                    }
                }
            }
        }
    }
}
