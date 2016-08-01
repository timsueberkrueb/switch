import QtQuick 2.4

FocusScope {
    id: overlay
    property color color
    property bool mouseAreaEnabled: true
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
    visible: opacity > 0

    Rectangle {
        anchors.fill: parent
        color: parent.color
    }

    MouseArea {
        enabled: showing && mouseAreaEnabled
        anchors.fill: parent
        onClicked: overlay.clicked()
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    Keys.onPressed: {
        if (mouseAreaEnabled)
            overlay.clicked();
    }
}

