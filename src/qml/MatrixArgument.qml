import QtQuick 2.4
import QtGraphicalEffects 1.0
import Ubuntu.Components 1.3


Item {
    property alias text: t.text
    property bool highlight: false
    property bool glowing: false
    property color glowColor: accentColor

    implicitHeight: units.dp(32)
    implicitWidth: units.dp(32)

    RectangularGlow {
        id: effect
        anchors.fill: parent
        opacity: glowing ? 1 : 0
        glowRadius: 2
        spread: 0.2
        color: glowColor
        cornerRadius: rect.radius + glowRadius

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    Rectangle {
        id: rect

        anchors.fill: parent

        radius: units.dp(5)
        clip: true
        gradient: Gradient {
           GradientStop { position: 0.0; color: highlight ? themeColor : "#f2f2f2" }
           GradientStop { position: 1.0; color: highlight ? themeColorGradientEnd : "#e6e6e6" }
        }

        Text {
            id: t
            color: highlight ? "white" : "black"
            anchors.centerIn: parent
        }
    }
}
