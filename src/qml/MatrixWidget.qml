import QtQuick 2.4
import QtQuick.Layouts 1.0


Item {
    id: matrixWidget

    property var matrix
    property int padding: units.dp(32)
    property bool isRowSelected: matrixContainer.selectedIndex !== -1
    property alias selectedRow: matrixContainer.selectedRow

    function selectNone() {
        matrixContainer.selectedIndex = -1;
    }

    function currentMatrix() {
        var m = [];
        for (var i=0; i<matrix.length; i++) {
            var item = matrixRepeater.itemAt(i);
            // Cancel if Repeater has not finished loading all items
            // Suppresses warning
            if (item === null)
                return matrix;
            m.push(matrixRepeater.itemAt(i).rowModel);
        }
        return m;
    }

    signal solved()
    signal modelChanged()

    width: childrenRect.width
    height: childrenRect.height

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
                // Cancel if Repeater has not finished loading all items
                // Suppresses warning
                if (matrixRow === null)
                    return
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
                    onRowModelChanged: {
                        matrixWidget.modelChanged();
                    }
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
