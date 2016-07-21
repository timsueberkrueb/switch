import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Item {
    id: matrixRow

    property var rowModel: []

    height: units.dp(48)
    width: content.width + divideHelper.width + units.dp(16)

    Item {
        id: content

        property alias rowModel: matrixRow.rowModel
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

        Row {
            id: row
            anchors.fill: parent
            spacing: units.dp(8)

            Repeater {
                model: matrixRow.rowModel
                delegate: MatrixArgument {
                    text: matrixRow.rowModel[index]
                    highlight:  index === matrixRow.rowModel.length-1
                    glowing: dropArea.containsDrag
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
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: content
        drag.smoothed: true
        drag.axis: Drag.XAndYAxis
        onReleased: {
            content.Drag.drop()
        }
    }

    Rectangle {
        id: divideHelper
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        property int gcd: Matrix.gcdOfArray(rowModel)
        property bool relevant: Math.abs(gcd) > 1
        opacity: (relevant && !dragArea.drag.active) ? 1 : 0
        width: units.dp(32)
        height: units.dp(32)
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
