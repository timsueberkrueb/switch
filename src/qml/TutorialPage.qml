import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Page {
    property list<Component> tutorialSections: [
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Hey! Welcome to Switch."
                    fontSize: "x-large"
                }

                UbuntuShape {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.dp(64)
                    height: units.dp(64)
                    source: Image {
                        source: "icon.png"
                    }
                }

                Label {
                    text: ("Switch is a game about solving systems of linear equations using the Gaussian elimination of matrices. <br/>" +
                           "Yeah, I know. That sounds scary. It doesn't really sound like a lot of fun, rather like one of <i>those</i> maths lessons, right? 😉")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    id: labelMorpheusQuote
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "”Then let us hope that I was wrong”"
                    width: Math.min(parent.width, metrics.width)
                    wrapMode: Text.WordWrap
                    fontSize: "large"

                    TextMetrics {
                        id: metrics
                        text: labelMorpheusQuote.text
                        font: labelMorpheusQuote.font
                    }
                }

                Label {
                    anchors.right: parent.right
                    anchors.rightMargin: units.dp(16)
                    text: "– <i>Morpheus</i>"
                }
            }
        },
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    text: "What is the matrix?"
                    fontSize: "x-large"
                }

                Label {
                    id: labelTrinityQuote
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "”The answer is out there, Neo. It's looking for you, and it will find you if you want it to.”"
                    width: Math.min(parent.width, metrics.width)
                    wrapMode: Text.WordWrap
                    fontSize: "large"

                    TextMetrics {
                        id: metrics
                        text: labelTrinityQuote.text
                        font: labelTrinityQuote.font
                    }
                }

                Label {
                    anchors.right: parent.right
                    anchors.rightMargin: units.dp(16)
                    text: "– <i>Trinity</i>"
                }

                Label {
                    text: ("The matrices in Switch are matrices of coefficients of associated systems of linear equations. Consider the following linear system: <br/>" +
                           "1) 1x + 1y = 3 <br/>" +
                           "2) 1x - 1y = 1 <br/>" +
                           "Now we're removing all the clutter ... <br/>" +
                           "[1 1 3]<br/>" +
                           "[1 -1 1]<br/>" +
                           "... and we get a matrix form like the one above.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: "Solutions?"
                    fontSize: "large"
                }

                Label {
                    text: ("In Switch, all matrices have exactly one correct solution. " +
                           "A solution is an assignment of values to the variables (x, y) such that all equations are correct. " +
                           "In our case the solution x=2, y=1 satisfies the linear system.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        },
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    text: "How to solve a matrix"
                    fontSize: "x-large"
                }

                Label {
                    text: ("There are multiple ways to solve a system of linear equations. " +
                           "In Switch you will use Gaussian elimination, also known as row reduction. "+
                           "Using the Gaussian elimination algorithm you can perform several actions on a matrix of coefficients. " +
                           "Those actions are called row operations. In switch you are able to ... <br/>" +
                           "... multiply a row by a number<br/>" +
                           "... add one row to another<br/>" +
                           "The goal of all this is to eliminate variables by setting the coefficient to zero. Remember our example: <br/>" +
                           "[1 1 3]<br/>" +
                           "[1 -1 1]<br/>" +
                           "To solve this matrix, we would like to eliminate the x variable from the second row. To achieve this, we'll multiply the first row by -1 " +
                           "and add it to the second row. The result:<br/>" +
                           "[-1 -1 -3]<br/>" +
                           "[0 -2 -2]<br/>" +
                           "In this simple case, this was the only step needed to solve the system: <br/>" +
                           "1) -1x -1y = -3 <br/>" +
                           "2) -2x = -2 <br/>" +
                           "Therefore: x = 2, y = 1")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        },
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    text: "And ... action!"
                    fontSize: "x-large"
                }

                Label {
                    text: "In Switch, this all is even more hassle-free. I think it's time to try it yourself."
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: ("Row operations:<br/>" +
                           "• You can drag and drop a row onto another to add it<br/>" +
                           "• You can drag and drop a row on the '×1' or '×(-1)' action fields to multiply it by a factor <br/>" +
                           "• By holding a row pressed over one of the action fields you can increase/decrease the value of the multiplicator<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                MatrixWidget {
                    anchors.horizontalCenter: parent.horizontalCenter
                    matrix: [
                        [1, 1, 3],
                        [1, -1, 1]
                    ]
                }

                Label {
                    text: "Ready? Check your solution!"
                }

                SolveWidget {
                    hideButtonVisible: false
                    solutions: [2, 1]
                    onSolved: {
                        PopupUtils.open(successDialogComponent);
                    }
                    onFailed: {
                        PopupUtils.open(failureDialogComponent);
                    }
                }

                Component {
                    id: successDialogComponent
                    Dialog {
                        id: dialog
                        title: "Success!"
                        text: "Are you ready for more?"
                        Button {
                            text: "Continue"
                            color: UbuntuColors.green
                            onClicked: {
                                pageStack.pop(tutorialPage);
                                PopupUtils.close(dialog);
                            }
                        }
                    }
                }

                Component {
                    id: failureDialogComponent
                    Dialog {
                        id: dialog
                        title: "Hmmm ..."
                        text: "This is not the correct solution. Try again!"
                        Button {
                            text: "Okay"
                            onClicked: {
                                PopupUtils.close(dialog);
                            }
                        }
                    }
                }
            }
        }
    ]

    visible: false

    header: MatrixHeader {
        title: "Tutorial"
    }

    Flickable {
        id: flickable
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: tutorialSectionSelect.top
        }

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
                sourceComponent: tutorialSections[tutorialSectionSelect.selectedIndex]
            }

        }
    }

    TutorialSectionSelect {
        id: tutorialSectionSelect
        sectionsCount: tutorialSections.length
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}

