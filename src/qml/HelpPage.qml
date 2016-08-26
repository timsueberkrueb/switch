import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3


Page {
    visible: false

    header: MatrixHeader {
        title: i18n.tr("Help")
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
                    text: i18n.tr("What is Switch?")
                    fontSize: "large"
                }

                Label {
                    text: i18n.tr("Switch is a game about solving systems of linear equations using the Gaussian elimination of matrices.")
                    wrapMode: Text.WordWrap
                    width: parent.width
                }

                Label {
                    text: i18n.tr("WTF?")
                    fontSize: "large"
                }

                Label {
                    text: (
                        i18n.tr("Errrm, yeah 😄") + " " +
                        i18n.tr("Actually, I'm not sure if you can call this 'a game' at all ...") + " " +
                        i18n.tr("However, if you're a student and you want to practise the Gaussian elimination algorithm a bit this app can help you.") + " " +
                        i18n.tr("You could also see this as a refreshingly different way to prepare for an exam 😉. It's basically up to you to define this app's purpose.") + " " +
                        i18n.tr("Of course, if you're not a student, Switch can still be a good way to train your mathematical skills.")
                    )
                    wrapMode: Text.WordWrap
                    width: parent.width
                }

                Label {
                    text: "<a href='#'>%1</a>".arg(i18n.tr("OMG seriously?! Get me out of here!"))
                    linkColor: UbuntuColors.orange
                    wrapMode: Text.WordWrap
                    width: parent.width
                    onLinkActivated: {
                        Qt.quit();
                    }
                }

                Label {
                    text: i18n.tr("How does it work?")
                    fontSize: "large"
                }

                Button {
                    text: i18n.tr("Show the tutorial")
                    color: UbuntuColors.green
                    onClicked: {
                        pageStack.push(tutorialPage);
                    }
                }
            }
        }
    }
}
