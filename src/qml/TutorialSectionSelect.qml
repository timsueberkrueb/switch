import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Rectangle {
    property int selectedIndex: 0
    property int sectionsCount: 0
    property bool canGoNext: selectedIndex < sectionsCount - 1
    property bool canGoPrevious: selectedIndex > 0

    function goNext() {
        if (canGoNext)
            selectedIndex++;
    }

    function goPrevious() {
        if (canGoPrevious)
            selectedIndex--;
    }

    implicitHeight: units.dp(48)
    color: themeColor

    Rectangle {
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            margins: units.dp(16)
        }
        height: units.dp(32)
        width: height
        radius: width * 0.5
        color: "white"
        enabled: canGoPrevious

        Icon {
            anchors.centerIn: parent
            name: "back"
            color: canGoPrevious ? UbuntuColors.warmGrey : UbuntuColors.lightGrey
            width: units.dp(16)
            height: width
        }

        MouseArea {
            anchors.fill: parent
            onClicked: goPrevious()
        }
    }

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: units.dp(8)

        Repeater {
            model: sectionsCount
            delegate: Rectangle {
                color: selectedIndex == index ? accentColor : "white"
                height: units.dp(32)
                width: height
                radius: width * 0.5

                Label {
                    anchors.centerIn: parent
                    text: (index+1).toString()
                    color: selectedIndex == index ? "white" : UbuntuColors.warmGrey
                    fontSize: "medium"

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: selectedIndex = index;
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
            }
        }
    }

    Rectangle {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: units.dp(16)
        }
        height: units.dp(32)
        width: height
        radius: width * 0.5
        color: "white"
        enabled: canGoNext

        Icon {
            anchors.centerIn: parent
            name: "go-next"
            color: canGoNext ? UbuntuColors.warmGrey : UbuntuColors.lightGrey
            width: units.dp(16)
            height: width
        }

        MouseArea {
            anchors.fill: parent
            onClicked: goNext()
        }
    }
}
