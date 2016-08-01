import QtQuick 2.4

FocusScope {
    id: overlay
    property color color
    property bool showing: false

    function show(){
        overlay.forceActiveFocus();
        showing = true;
    }

    function hide(){
        showing = false;
    }

    signal clicked

    z: 25
    opacity: showing ? 1 : 0

    Rectangle {
        anchors.fill: parent
        color: parent.color
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    MouseArea {
        enabled: showing
        anchors.fill: parent
        onClicked: overlay.clicked()
    }

    Keys.onPressed: {
        overlay.clicked();
    }
}

