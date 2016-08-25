import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    visible: false

    header: MatrixHeader {
        title: i18n.tr("About")
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
                width: parent.width
                spacing: units.dp(8)

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Switch v0.1.3"
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
                    text: i18n.tr("A simple game about linear equations")
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    text: i18n.tr("Credits")
                    fontSize: "large"
                }

                Label {
                    text: i18n.tr("Thanks to <a href='%1'>Stuart Langridge</a> for testing, design input and QA.").arg("https://twitter.com/sil")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link);
                }

                Label {
                    text: i18n.tr("Thanks to <a href='%1'>Sam Hewitt</a> for creating the <a href='%2'>Ubuntu Icon Resource Kit</a> which was used to create the application icon.")
                           .arg("http://samuelhewitt.com/")
                           .arg("https://github.com/snwh/ubuntu-icon-resource-kit")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link);
                }

                Label {
                    text: i18n.tr("License and Copyright")
                    fontSize: "large"
                }

                Label {
                    text: i18n.tr("Source code available on <a href='%1'>GitHub</a>.").arg("https://github.com/tim-sueberkrueb/switch")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link);
                }

                Label {
                    text: ("This application is free software: you can redistribute it and/or modify it under the terms of" +
                           " the GNU General Public License as published by the Free Software Foundation, either version 3 of the " +
                           "License, or (at your option) any later version.<br/><br/>Copyright © 2016 Tim Süberkrüb<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: units.dp(8)

                    Button {
                        text: ("★ %1").arg(i18n.tr("Rate"))
                        color: UbuntuColors.green
                        onClicked: {
                            Qt.openUrlExternally("scope://com.canonical.scopes.clickstore?q=Switch by Tim Süberkrüb")
                        }
                    }

                    Button {
                        text: ("🐞 %1").arg(i18n.tr("Report bug"))
                        color: UbuntuColors.orange
                        onClicked: {
                            Qt.openUrlExternally("https://github.com/tim-sueberkrueb/switch/issues/new");
                        }
                    }

                    Button {
                        text: ("♥ %1").arg(i18n.tr("Contribute"))
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
