import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "."

Page {
    signal levelSelected(var level)

    header: MatrixHeader {
        title: "Switch"
        contents: RowLayout {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Label {
                text: header.title
                color: "white"
                fontSize: "large"
            }

            Item {
                Layout.fillWidth: true
                height: 1
            }

            Label {
                text: "Score: %1".arg(Game.score)
                color: "white"
            }
        }
        trailingActionBar.actions: [
            Action {
                iconName: "help"
                text: "Help"
                onTriggered: {
                    pageStack.push(helpPage, {})
                }
            },
            Action {
                iconName: "toolkit_tick"
                text: "Stats"
                onTriggered: {
                    pageStack.push(statsPage, {});
                }
            },
            Action {
                iconName: "info"
                text: "About"
                onTriggered: {
                    pageStack.push(aboutPage, {});
                }
            }
        ]
        trailingActionBar.numberOfSlots: 0
    }

    Item {
        id: contentItem
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        ListView {
            anchors {
                fill: parent
                margins: units.dp(8)
            }
            model: Game.levelModel
            delegate: ListItem {              
                property bool locked: model.scoreRequired > Game.score

                enabled: !locked
                width: parent.width
                height: units.dp(64)

                RowLayout {
                    anchors {
                        fill: parent
                        margins: units.dp(8)
                    }

                    spacing: units.dp(16)

                    Rectangle {
                        Layout.fillWidth: false
                        Layout.fillHeight: true

                        width: units.dp(48)
                        height: width
                        radius: width * 0.5
                        color: locked ? "grey" : model.color

                        Label {
                            anchors.centerIn: parent
                            color: "white"
                            text: locked ? "?" : (index + 1).toString()
                            fontSize: "large"
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Column {
                            anchors.fill: parent
                            spacing: units.dp(8)

                            Label {
                                text: locked ? "🔒 Locked" : model.title
                                fontSize: "large"
                            }

                            Label {
                                text: locked ? "Earn %1 more points to unlock".arg(model.scoreRequired-Game.score) : model.description
                                width: parent.width
                                elide: Text.ElideRight
                            }
                        }
                    }
                }

                onClicked: {
                    levelSelected(model);
                }
            }
        }
    }
}
