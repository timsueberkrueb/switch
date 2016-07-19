import QtQuick 2.4
import "."


ActionField {
    id: actionField

    property int postive: 0
    property int negative: 1
    property int mode: postive

    property var originalRowModel
    property var currentRow
    property int multiplier: mode == postive ? 1 : -1
    text: "× %1".arg(mode == postive ? multiplier.toString() : "(%1)".arg(multiplier.toString()))

    onEntered: {
        actionField.originalRowModel = drag.source.rowModel;
        actionField.currentRow = drag.source;
    }

    onExited: {
        multiplier = mode == postive ? 1 : -1;
        actionField.currentRow.rowModel = originalRowModel;
    }

    onDropped: {
        multiplier = mode == postive ? 1 : -1;
    }

    onTriggered: {
        var rm = actionField.originalRowModel;
        var newRm = Matrix.multiplyRow(rm, actionField.multiplier);
        actionField.currentRow.rowModel = newRm;
        mode == postive ? actionField.multiplier++ : actionField.multiplier--;
    }
}
