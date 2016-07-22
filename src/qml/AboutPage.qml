import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    visible: false

    header: MatrixHeader {
        title: "About"
    }

    Flickable {
        id: flickable
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight: contentItem.height + contentItem.padding * 2

        Item {
            id: contentItem
            property int padding: units.dp(16)
            x: padding
            y: padding
            width: parent.width - (2 * padding)
            height: childrenRect.height

            Column {
                anchors.fill: parent
                spacing: units.dp(8)

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Switch v0.1"
                    fontSize: "large"
                }

                UbuntuShape {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.dp(64)
                    height: units.dp(64)
                    source: Image {
                        source: "icon.png"
                    }
                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "A simple game about linear equations"
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    text: "Source code available on <a href='https://github.com/tim-sueberkrueb/switch'>GitHub</a>."
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link);
                }

                Label {
                    text: ("This application is free software: you can redistribute it and/or modify it under the terms of" +
                           " the GNU General Public License as published by the Free Software Foundation, either version 3 of the " +
                           "License, or (at your option) any later version.<br/><br/>Copyright (C) 2016 Tim Süberkrüb<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: units.dp(8)

                    Button {
                        text: "★ Rate"
                        color: UbuntuColors.green
                        onClicked: {
                            Qt.openUrlExternally("scope://com.canonical.scopes.clickstore?q=Switch")
                        }
                    }

                    Button {
                        text: "🐞 Report bug"
                        color: UbuntuColors.red
                        onClicked: {
                            Qt.openUrlExternally("https://github.com/tim-sueberkrueb/switch/issues/new");
                        }
                    }

                    Button {
                        text: "♥ Contribute"
                        color: UbuntuColors.darkAubergine
                        onClicked: {
                            Qt.openUrlExternally("https://github.com/tim-sueberkrueb/switch");
                        }
                    }
                }
            }
        }
    }
}
