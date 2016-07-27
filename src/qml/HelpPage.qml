import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3


Page {
    visible: false

    header: MatrixHeader {
        title: "Help"
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
                    text: "What is Switch?"
                    fontSize: "large"
                }

                Label {
                    text: "Switch is a game about solving systems of linear equations using the Gaussian elimination of matrices."
                    wrapMode: Text.WordWrap
                    width: parent.width
                }

                Label {
                    text: "WTF?"
                    fontSize: "large"
                }

                Label {
                    text: (
                        "Errrm, yeah 😄 " +
                        "Actually, I'm not sure if you can call this 'a game' at all ... " +
                        "However, if you're a student and you want to practise the Gaussian elimination algorithm a bit this app can help you. " +
                        "You could also see this as a refreshingly different way to prepare for an exam 😉. It's basically up to you to define this app's purpose. " +
                        "Of course, if you're not a student, Switch can still be a good way to train your mathematical skills."
                    )
                    wrapMode: Text.WordWrap
                    width: parent.width
                }

                Label {
                    text: "<a href='#'>OMG seriously?! Get me out of here!</a>"
                    linkColor: UbuntuColors.orange
                    wrapMode: Text.WordWrap
                    width: parent.width
                    onLinkActivated: {
                        Qt.quit();
                    }
                }

                Label {
                    text: "How does it work?"
                    fontSize: "large"
                }

                Button {
                    text: "Show the tutorial"
                    color: UbuntuColors.green
                    onClicked: {
                        pageStack.push(tutorialPage);
                    }
                }
            }
        }
    }
}
