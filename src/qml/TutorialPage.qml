import QtQuick 2.4
import Ubuntu.Components 1.3
import "."

Page {
    id: tutorialPage

    property var tutorialSections: TutorialSections {}

    visible: false
    header: MatrixHeader {
        id: normalHeader
        title: "Tutorial"
    }

    onActiveChanged: {
        if (!active)
            tutorialSectionSelect.selectedIndex = 0;
    }

    Flickable {
        id: flickable
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: tutorialSectionSelect.top
        }

        interactive: contentHeight > height
        contentHeight: contentItem.height + contentItem.padding * 2

        Item {
            id: contentItem
            property int padding: units.dp(16)
            x: padding
            y: padding
            width: parent.width - (2 * padding)
            height: loader.item.height

            Loader {
                id: loader
                width: parent.width
                sourceComponent: tutorialSections.components[tutorialSectionSelect.selectedIndex]
                onSourceComponentChanged: flickable.contentY = 0;
            }

            Binding {
                when: tutorialSectionSelect.selectedIndex === 4
                target: tutorialPage
                property: "matrixWidget"
                value: loader.item.matrixWidget
            }
        }
    }

    SwipeArea {
        anchors.fill: flickable
        enabled: loader.item.swipingEnabled
        direction: SwipeArea.Horizontal
        onDraggingChanged: {
            if (!dragging) {
                if (distance > units.dp(100))
                    tutorialSectionSelect.goPrevious();
                else if (distance < units.dp(-100))
                    tutorialSectionSelect.goNext();
            }
        }
    }

    TutorialSectionSelect {
        id: tutorialSectionSelect
        sectionsCount: tutorialSections.components.length
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}

