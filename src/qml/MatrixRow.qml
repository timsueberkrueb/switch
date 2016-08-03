import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Item {
    id: matrixRow

    property var rowModel: []
    property bool isSelected: false
    property bool isRowCanonicalForm: {
        var canonical = false;
        for (var i=0; i<rowModel.length-1; i++) {
            if (rowModel[i] === 1 || rowModel[i] === -1) {
                if (canonical) {
                    canonical = false;
                    break;
                }
                canonical = true;
            }
            else if (rowModel[i] !== 0) {
                canonical = false;
                break;
            }
        }
        return canonical;
    }
    property int currentMultiplier: 0

    signal selected()

    height: units.dp(48)
    width: content.width + appendix.width + units.dp(16)

    Item {
        id: content

        property alias rowModel: matrixRow.rowModel
        property alias currentMultiplier: matrixRow.currentMultiplier
        property bool hoveringDropArea: false

        height: units.dp(32)
        width: row.childrenRect.width

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        states: [
            State {
                when: dragArea.drag.active
                AnchorChanges {
                    target: content;
                    anchors.verticalCenter: undefined
                    anchors.left: undefined
                }
                ParentChange {
                    target: content
                    parent: matrixContainer
                }
            }
        ]

        Drag.active: dragArea.drag.active
        Drag.hotSpot.x: width/2
        Drag.hotSpot.y: height/2

        Row {
            id: row
            anchors.fill: parent
            spacing: units.dp(8)

            Repeater {
                model: matrixRow.rowModel
                delegate: MatrixArgument {
                    text: matrixRow.rowModel[index]
                    highlight:  index === matrixRow.rowModel.length-1
                    glowing: dropArea.containsDrag || isSelected
                    glowColor: dropArea.containsDrag ? accentColor : themeColor
                }
            }
        }

        Rectangle {
            anchors {
                right: parent.left
                rightMargin: units.dp(16)
                verticalCenter: parent.verticalCenter
            }
            opacity: content.hoveringDropArea ? 1 : 0
            width: units.dp(32)
            height: units.dp(32)
            color: accentColor
            radius: width * 0.5

            Label {
                anchors.centerIn: parent
                color: "white"
                text: "+"
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Rectangle {
            id: multiplyHint
            anchors {
                left: parent.right
                leftMargin: units.dp(16)
                verticalCenter: parent.verticalCenter
            }

            property int multiplier: currentMultiplier === 0 ? 1 : currentMultiplier

            width: units.dp(32)
            height: units.dp(32)
            opacity: currentMultiplier === 0 ? 0 : 1
            color: accentColor
            radius: width * 0.5

            Label {
                anchors.centerIn: parent
                text: "× %1".arg(multiplyHint.multiplier).toString()
                color: "white"
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: content
        drag.smoothed: true
        drag.axis: Drag.YAxis

        onReleased: {
            content.Drag.drop()
        }

        onPressed: {
            matrixRow.selected();
        }
    }

    Item {
        id: appendix
        width: units.dp(32)
        height: units.dp(32)
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: divideHelper
            anchors.fill: parent
            property int gcd: Matrix.gcdOfArray(rowModel)
            property bool relevant: Math.abs(gcd) > 1 || gcd === -1
            opacity: (relevant && !dragArea.drag.active && currentMultiplier === 0) ? 1 : 0
            visible: opacity > 0
            color: accentColor
            radius: width * 0.5

            Label {
                anchors.centerIn: parent
                text: "÷ " + divideHelper.gcd
                color: "white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rowModel = Matrix.multiplyRow(rowModel, 1/divideHelper.gcd);
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    DropArea {
        id: dropArea
        anchors.fill: parent

        onEntered: {
            drag.source.hoveringDropArea = drag.source !== content;
            drag.accept(Qt.CopyAction);
        }

        onExited: {
            drag.source.hoveringDropArea = false;
        }

        onDropped: {
            drag.source.hoveringDropArea = false;
            if (drop.source != content) {
                rowModel = Matrix.addRowToRow(drop.source.rowModel, rowModel);
            }
        }
    }
}
