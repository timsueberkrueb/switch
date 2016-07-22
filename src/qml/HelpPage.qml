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

                Label {
                    text: (
                        "The game consists of several levels in ascending order of difficulty. " +
                        "You can choose a level to play by selecting one in the list showing up when you start the app.<br/>" +
                        "Once you have selected a level the main game page will open. The main level element is a matrix of coefficients. " +
                        "Each row stands for one line of the corresponding system of linear equations.<br/>" +
                        "<b>Example</b>: " +
                        "Consider the following matrix row: [0, 2, 0, 4].<br/>" +
                        "The related equation is 0×X1 + 2×X2 + 0×X3 = 4<br/>" +
                        "Therefore: X2 = 4÷2 -> X2 = 2<br/>" +
                        "The problem is that the matrix rows won't be that simple most times. " +
                        "That's where Gaussian elimination (or row reduction) algorithm comes in: <br/>" +
                        "<a href='https://en.wikipedia.org/wiki/Gaussian_elimination'>Learn about Gaussian elimination</a>. <br/>" +
                        "Row operations:<br/>" +
                        "• You can drag and drop a row onto another to add it<br/>" +
                        "• You can drag and drop a row on the '×1' or '×(-1)' action fields to multiply it by a factor <br/>" +
                        "• By holding a row pressed over one of the action fields you can increase/decrease the value of the multiplicator<br/>" +
                        "Your goal will be to transform the matrix into upper <a href='https://en.wikipedia.org/wiki/Triangular_matrix'>triangular form</a>. <b>Example:</b><br/>" +
                        "[1 4 1]<br/>" +
                        "[0 3 4]<br/>" +
                        "[0 0 1]<br/>" +
                        "After that, you can click on the 'Solve' button which will bring up a form where you can enter the solutions for the matrix."
                    )
                    wrapMode: Text.WordWrap
                    width: parent.width
                    linkColor: UbuntuColors.orange
                    onLinkActivated: {
                        Qt.openUrlExternally(link);
                    }
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
