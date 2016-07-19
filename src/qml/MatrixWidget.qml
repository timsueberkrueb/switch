import QtQuick 2.4
import QtQuick.Layouts 1.0


Item {
    id: matrixWidget

    property var matrix
    property int padding: units.dp(32)

    width: childrenRect.width + padding * 2
    height: childrenRect.height + padding * 2

    Row {
        id: row
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
                }

                MultiplyActionField {
                    id: actionFieldMultiplyNegative
                    mode: negative
                }
            }
        }

        Item {
            id: matrixContainer
            width: matrixColumn.width
            height: matrixColumn.height

            Column {
                id: matrixColumn
                spacing: units.dp(8)

                Repeater {
                    model: matrix;
                    delegate: MatrixRow {
                        rowModel: matrix[index]
                    }
                }
            }
        }
    }
}
