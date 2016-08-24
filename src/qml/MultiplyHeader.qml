import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "."

MatrixHeader {
    id: multiplyHeader
    visible: matrixWidget.isRowSelected

    property int range: 15
    property MatrixWidget matrixWidget
    property bool isDragActive: dragArea.drag.active

    property int factor: {
        if (dragArea.drag.active) {
            var relLen = ((contents.width - units.dp(16)) / 2) + (multiplySlider.width / 2)
            var relPos = dropArea.drag.x - relLen;
            var perc = (relPos / relLen);
            var value = Math.ceil(perc * (range + 1));
            return value === 0 ? 1 : value;
        }
        return 1;
    }

    Binding {
        when: matrixWidget.isRowSelected && dragArea.drag.active
        target: matrixWidget.selectedRow !== undefined ? matrixWidget.selectedRow : null
        // target: suppress warnings
        property: "currentMultiplier"
        value: multiplyHeader.factor == 1 ? 0 : multiplyHeader.factor
    }

    contents: Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            Row {
                Layout.preferredHeight: units.dp(32)
                spacing: units.dp(16)
                opacity: dragArea.drag.active ? 0 : 1

                Icon {
                    anchors.verticalCenter: parent.verticalCenter
                    width: units.dp(16)
                    height: width
                    name: "close"
                    color: "white"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            matrixWidget.selectNone();
                        }
                    }
                }

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: i18n.tr("Move the slider to multiply")
                    color: "white"
                    opacity: dragArea.drag.active ? 0 : 1

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }

            Item {
                Layout.preferredHeight: units.dp(64)
                Layout.fillWidth: true

                Icon {
                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                        margins: units.dp(24)
                    }
                    width: units.dp(16)
                    height: width
                    name: "list-remove"
                    color: "white"
                }

                Rectangle {
                    id: multiplySlider
                    anchors {
                        bottom: parent.bottom
                        margins: units.dp(16)
                    }

                    x: parent.width/2 - width/2
                    width: units.dp(32)
                    height: width
                    radius: width * 0.5
                    color: "white"

                    Drag.active: dragArea.drag.active
                    Drag.hotSpot.x: width/2
                    Drag.hotSpot.y: height/2

                    states: [
                        State {
                            when: !dragArea.drag.active
                            PropertyChanges {
                                target: multiplySlider
                                x: parent.width/2 - width/2
                            }
                        }
                    ]

                    Icon {
                        anchors {
                            fill: parent
                            margins: units.dp(6)
                        }
                        name: "view-grid-symbolic"
                    }

                    MouseArea {
                        id: dragArea
                        anchors.fill: parent
                        drag.target: parent
                        drag.axis: Drag.XAxis
                        onReleased: {
                            var newRm = Matrix.multiplyRow(matrixWidget.selectedRow.rowModel, multiplyHeader.factor);
                            matrixWidget.selectedRow.rowModel = newRm;
                        }
                    }

                    Item {
                        opacity: dragArea.drag.active ? 1 : 0
                        visible: matrixWidget.isRowSelected && opacity > 0
                        z: 20

                        anchors {
                            bottom: multiplySlider.top
                            horizontalCenter: multiplySlider.horizontalCenter
                        }

                        width: units.dp(32)
                        height: units.dp(48)

                        Canvas {
                            y: units.dp(12)

                            width: parent.width
                            height: parent.width

                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.fillStyle = accentColor;
                                ctx.beginPath();
                                ctx.moveTo(units.dp(8), 0);

                                ctx.quadraticCurveTo(units.dp(12), units.dp(30), units.dp(16), units.dp(32));
                                ctx.quadraticCurveTo(units.dp(22), units.dp(30), units.dp(24), units.dp(0));
                                ctx.closePath();
                                ctx.fill();
                            }
                        }

                        Rectangle {
                            width: parent.width
                            height: width
                            radius: width * 0.5
                            color: accentColor

                            Label {
                                anchors.centerIn: parent
                                text: "× %1".arg(multiplyHeader.factor.toString())
                                color: "white"
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
                }

                Icon {
                    anchors {
                        bottom: parent.bottom
                        right: parent.right
                        margins: units.dp(24)
                    }
                    width: units.dp(16)
                    height: width
                    name: "list-add"
                    color: "white"
                }
            }

        }
    }

    StyleHints {
        contentHeight: units.dp(96)
    }

    Behavior on leadingActionBar.opacity {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
