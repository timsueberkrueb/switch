import QtQuick 2.4
import Ubuntu.Components 1.3

PageHeader {
    property color color: themeColor

    StyleHints {
        foregroundColor: "white"
        backgroundColor: color
        dividerColor: "transparent"
    }
}

