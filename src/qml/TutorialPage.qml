import QtQuick 2.4
import QtQuick.Layouts 1.1
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
                           "Now we're removing all the clutter ... <br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Image {
                    source: "img/tutorial/matrix_example_01.svg"
                    transform: Scale {
                        xScale: 0.75
                        yScale: 0.75
                    }
                }

                Label {
                    text: "... and we get a matrix form like the one above."
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
                           "In Switch you will use <a href='https://en.wikipedia.org/wiki/Gaussian_elimination'>Gaussian elimination</a>, also known as row reduction. "+
                           "Using the Gaussian elimination algorithm you can perform several actions on a matrix of coefficients. " +
                           "Those actions are called row operations. In Switch you are able to ... <br/>" +
                           "... multiply a row by a number<br/>" +
                           "... add one row to another<br/>" +
                           "The goal of all this is to eliminate variables by setting the coefficient to zero. Remember our example: <br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link)
                }

                Image {
                    source: "img/tutorial/matrix_example_01.svg"
                    transform: Scale {
                        xScale: 0.75
                        yScale: 0.75
                    }
                }

                Label {
                    text: ("To solve this matrix, we would like to eliminate the x variable from the second row. To achieve this, we'll multiply the first row by -1 " +
                           "and add it to the second row. The result:<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Image {
                    source: "img/tutorial/matrix_example_02.svg"
                    transform: Scale {
                        xScale: 0.75
                        yScale: 0.75
                    }
                }

                Label {
                    text: ("In this simple case, this was the only step needed to solve the system. <br/>" +
                           "Our matrix is transformed into upper <a href='https://en.wikipedia.org/wiki/Triangular_matrix'>triangular form</a>. " +
                           "We can now finish solving the matrix in your head:<br/>" +
                           "1) -1x -1y = -3 <br/>" +
                           "2) -2x = -2 <br/>" +
                           "Therefore: x = 2, y = 1")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link)
                }

                Label {
                    text: "Alternatively we can continue to simplify the matrix using the row operations ..."
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Image {
                    source: "img/tutorial/matrix_example_03.svg"
                    transform: Scale {
                        xScale: 0.75
                        yScale: 0.75
                    }
                }

                Label {
                    text: " ... until we end up with the so called reduced <a href='https://en.wikipedia.org/wiki/Row_echelon_form'>row echelon form</a>."
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link)
                }
            }
        },
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    text: "And ... action"
                    fontSize: "x-large"
                }

                Label {
                    text: "In Switch, this all is even more hassle-free. I think it's time to try it yourself."
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: ("Row operations:<br/>" +
                           "<u>Add:</u><br/>" +
                           "• You can drag and drop a row onto another to add it<br/>" +
                           "<u>Multiply</u><br/>" +
                           "• You can drag and drop a row on the '×1' or '×(-1)' action fields to multiply it by a factor <br/>" +
                           "• By holding a row pressed over one of the action fields you can increase/decrease the value of the multiplicator<br/>" +
                           "<i>or</i><br/>" +
                           "• Tap on a row to select it<br/>" +
                           "• Press on the multiplier fields to multiply the selected row by a factor<br/>" +
                           "• Hold pressed a multiplier field to increase/decrease the value of the mutliplicator<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: ("In Switch, there are two ways to solve a matrix:<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                RowLayout {
                    width: parent.width
                    spacing: units.dp(16)

                    Label {
                        Layout.fillWidth: true
                        text: ("1. Transform the matrix into upper <a href='https://en.wikipedia.org/wiki/Triangular_matrix'>triangular form</a> "+
                               "using the row operations. Click on the 'Solve' button when you think you know the solutions.<br/>" +
                               "⊕ time efficient for small matrices<br/>" +
                               "⊕ train your mental arithmetic skills<br/>" +
                               "⊖ difficult for bigger matrices<br/>" +
                               "↳ recommended for smaller matrices")
                        width: parent.width
                        wrapMode: Text.WordWrap
                        linkColor: UbuntuColors.orange
                        onLinkActivated: Qt.openUrlExternally(link)
                    }

                    Image {
                        sourceSize.width: 100
                        source: "img/tutorial/matrix_example_02.svg"
                    }
                }

                RowLayout {
                    width: parent.width
                    spacing: units.dp(16)

                    Label {
                        Layout.fillWidth: true
                        text: ("2. Simplify the matrix as much as possible by using the row operations. "+
                               "You will end up with the so called reduced <a href='https://en.wikipedia.org/wiki/Row_echelon_form'>row echelon form</a> " +
                               "and Switch will detect that the matrix is sovled.<br/>" +
                               "⊕ easy on the brain (no need for mental arithmetic)<br/>" +
                               "⊖ wastefully time consuming for smaller matrices<br/>" +
                               "↳ recommended for big matrices")
                        width: parent.width
                        wrapMode: Text.WordWrap
                        linkColor: UbuntuColors.orange
                        onLinkActivated: Qt.openUrlExternally(link)
                    }

                    Image {
                        sourceSize.width: 100
                        source: "img/tutorial/matrix_example_03.svg"
                    }
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    id: labelNeoQuote
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "”The problem is choice.”"
                    width: Math.min(parent.width, metrics.width)
                    wrapMode: Text.WordWrap
                    fontSize: "large"

                    TextMetrics {
                        id: metrics
                        text: labelNeoQuote.text
                        font: labelNeoQuote.font
                    }
                }

                Label {
                    anchors.right: parent.right
                    anchors.rightMargin: units.dp(16)
                    text: "– <i>Neo</i>"
                }
            }
        },
        Component {
            Column {
                spacing: units.dp(8)

                Label {
                    text: "Let's go"
                    fontSize: "x-large"
                }

                Label {
                    text: "I think it's time to try it yourself."
                    width: parent.width
                    wrapMode: Text.WordWrap
                }


                Label {
                    text: ("As soon as you think you got it, you can <a href='#'>check your solution</a>. "+
                           "Or, alternatively, simplify it to the very end and Switch will handle the rest.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: {
                        PopupUtils.open(solveDialogComponent);
                    }
                }

                MatrixWidget {
                    anchors.horizontalCenter: parent.horizontalCenter
                    matrix: [
                        [1, 1, 3],
                        [1, -1, 1]
                    ]
                    onSolved: {
                        PopupUtils.open(successDialogComponent);
                    }
                }

                Label {
                    text: "No idea what to do? <a href='#'>Go back to the explanations</a>."
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: {
                        tutorialSectionSelect.selectedIndex--;
                    }
                }

                Component {
                    id: solveDialogComponent
                    Dialog {
                        id: dialog
                        SolveWidget {
                            solutions: [2, 1]
                            onSolved: {
                                dialog.hide();
                                PopupUtils.open(successDialogComponent);
                            }
                            onFailed: {
                                dialog.hide();
                                PopupUtils.open(failureDialogComponent);
                            }
                            onHideRequested: dialog.hide();
                        }
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
                onSourceComponentChanged: flickable.contentY = 0;
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

