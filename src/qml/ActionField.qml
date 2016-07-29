import QtQuick 2.4
import Ubuntu.Components 1.3


Item {
    id: actionField

    property string text: ""
    property int padding: units.dp(16)
    property int duration: 1000
    property color color: accentColor
    property bool mouseAreaEnabled: true

    readonly property double progress: progressTimer.elapsed / progressTimer.duration

    signal entered(var drag)
    signal exited(var drag)
    signal dropped(var drag)
    signal pressed()
    signal released()
    signal triggered()

    onProgressChanged: {
        canvas.requestPaint();
    }

    width: units.dp(100)
    height: units.dp(100)

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.beginPath();
            ctx.clearRect(0,0, parent.width, parent.height)
            ctx.lineWidth = 4;
            ctx.strokeStyle = actionField.color;
            ctx.arc(parent.width/2, parent.height/2,
                    parent.width/2-padding, 0, (Math.PI*2)*progress)
            ctx.stroke();
        }
    }

    Text {
        anchors.centerIn: parent
        text: actionField.text
        font.pixelSize: units.dp(20)
    }

    Timer {
        id: progressTimer
        property int elapsed: 0
        property int duration: actionField.duration
        interval: 20
        onTriggered: {
            elapsed += interval;
            if (elapsed == duration) {
                actionField.triggered();
                progressTimer.elapsed = 0;
                progressTimer.restart();
            }
            else {
                progressTimer.start();
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        enabled: mouseAreaEnabled

        onPressed: {
            progressTimer.start();
            actionField.pressed();
        }

        onReleased: {
            progressTimer.stop();
            progressTimer.elapsed = 0;
            actionField.released();
        }
    }

    DropArea {
        anchors.fill: parent

        onEntered: {
            progressTimer.start();
            actionField.entered(drag);
        }

        onExited: {
            progressTimer.stop();
            progressTimer.elapsed = 0;
            actionField.exited(drag);
        }

        onDropped: {
            progressTimer.stop();
            progressTimer.elapsed = 0;
            actionField.dropped(drag);
        }
    }
}
