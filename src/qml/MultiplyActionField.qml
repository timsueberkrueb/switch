import QtQuick 2.4
import "."


ActionField {
    id: actionField

    property int postive: 0
    property int negative: 1
    property int mode: postive

    property var selectedRow
    property var originalRowModel
    property var currentRow
    property int multiplier: mode == postive ? 1 : -1

    text: "× %1".arg(mode == postive ? multiplier.toString() : "(%1)".arg(multiplier.toString()))
    mouseAreaEnabled: selectedRow !== undefined

    onPressed: {
        if (selectedRow) {
            actionField.originalRowModel = selectedRow.rowModel;
            actionField.currentRow = selectedRow;
            selectedRow.currentMultiplier = Qt.binding(function() { return multiplier; });
        }
    }

    onReleased: {
        multiplier = mode == postive ? 1 : -1;
        selectedRow.currentMultiplier = 0;
    }

    onEntered: {
        actionField.originalRowModel = drag.source.rowModel;
        actionField.currentRow = drag.source;
        actionField.currentRow.currentMultiplier = Qt.binding(function() { return multiplier; });
    }

    onExited: {
        multiplier = mode == postive ? 1 : -1;
        actionField.currentRow.rowModel = originalRowModel;
        actionField.currentRow.currentMultiplier = 0;
    }

    onDropped: {
        multiplier = mode == postive ? 1 : -1;
        actionField.currentRow.currentMultiplier = 0;
    }

    onTriggered: {
        var rm = actionField.originalRowModel;
        var newRm = Matrix.multiplyRow(rm, actionField.multiplier);
        actionField.currentRow.rowModel = newRm;
        mode == postive ? actionField.multiplier++ : actionField.multiplier--;
    }
}
