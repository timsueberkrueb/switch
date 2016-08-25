import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Item {
    property list<Component> components: [
        Component {
            TutorialColumn {
                spacing: units.dp(8)

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18n.tr("Hey! Welcome to Switch.")
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
                    text: i18n.tr("Switch is a game about solving systems of linear equations using the Gaussian elimination of matrices. <br/>") +
                          i18n.tr("Yeah, I know. That sounds scary. It doesn't really sound like a lot of fun, rather like one of <i>those</i> maths lessons, right? 😉")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    id: labelMorpheusQuote
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18n.tr("”Then let us hope that I was wrong”")
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
                    text: i18n.tr("– <i>Morpheus</i>")
                }
            }
        },
        Component {
            TutorialColumn {
                spacing: units.dp(8)

                Label {
                    text: i18n.tr("What is the matrix?")
                    fontSize: "x-large"
                }

                Label {
                    id: labelTrinityQuote
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18n.tr("”The answer is out there, Neo. It's looking for you, and it will find you if you want it to.”")
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
                    text: i18n.tr("– <i>Trinity</i>")
                }

                Label {
                    text: i18n.tr("The matrices in Switch are matrices of coefficients of associated systems of linear equations. Consider the following linear system: <br/>") +
                           "1) 1x + 1y = 3 <br/>" +
                           "2) 1x - 1y = 1 <br/>" +
                           i18n.tr("Now we're removing all the clutter ... <br/>")
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
                    text: i18n.tr("... and we get a matrix form like the one above.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: i18n.tr("Solution?")
                    fontSize: "large"
                }

                Label {
                    text: i18n.tr("In Switch, all matrices have exactly one correct solution. ") +
                          i18n.tr("A solution is an assignment of values to the variables (x, y) such that all equations are correct. ") +
                          i18n.tr("In our case the solution x=2, y=1 satisfies the linear system.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        },
        Component {
            TutorialColumn {
                spacing: units.dp(8)

                Label {
                    text: i18n.tr("How to solve a matrix")
                    fontSize: "x-large"
                }

                Label {
                    text: i18n.tr("There are multiple ways to solve a system of linear equations. ") +
                          i18n.tr("In Switch you will use <a href='https://en.wikipedia.org/wiki/Gaussian_elimination'>Gaussian elimination</a>, also known as row reduction. ") +
                          i18n.tr("Using the Gaussian elimination algorithm you can perform several actions on a matrix of coefficients. ") +
                          i18n.tr("Those actions are called row operations. In Switch you are able to ... <br/>") +
                          i18n.tr("... multiply a row by a number<br/>") +
                          i18n.tr("... add one row to another<br/>") +
                          i18n.tr("The goal of all this is to eliminate variables by setting the coefficient to zero. Remember our example: <br/>")
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
                    text: i18n.tr("To solve this matrix, we would like to eliminate the x variable from the second row. ") +
                          i18n.tr("To achieve this, we'll multiply the first row by -1 and add it to the second row. The result:<br/>")
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
                    text: i18n.tr("In this simple case, this was the only step needed to solve the system. <br/>") +
                          i18n.tr("Our matrix is transformed into upper <a href='https://en.wikipedia.org/wiki/Triangular_matrix'>triangular form</a>, which means that all matix entries below the <a href='https://en.wikipedia.org/wiki/Main_diagonal'>main diagonal</a> are zero. ") +
                          i18n.tr("We can now finish solving the matrix in your head:<br/>") +
                          "1) -1x -1y = -3 <br/>" +
                          "2) -2y = -2 <br/>" +
                          i18n.tr("Therefore: x = 2, y = 1")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link)
                }

                Label {
                    text: i18n.tr("Alternatively we can continue to simplify the matrix using the row operations ...")
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
                    text: i18n.tr(" ... until we end up with the so called reduced <a href='https://en.wikipedia.org/wiki/Row_echelon_form'>row echelon form</a>. ") +
                          i18n.tr("This means that in every row there is exactly one leading coefficient which is 1. ") +
                          i18n.tr("All other entries in the same column are 0.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: Qt.openUrlExternally(link)
                }
            }
        },
        Component {
            TutorialColumn {
                spacing: units.dp(8)

                Label {
                    text: i18n.tr("And ... action")
                    fontSize: "x-large"
                }

                Label {
                    text: i18n.tr("In Switch, this all is even more hassle-free. I think it's time to try it yourself.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: i18n.tr("Row operations:<br/>") +
                          i18n.tr("<u>Add:</u><br/>") +
                          i18n.tr("• You can drag and drop a row onto another to add it<br/>") +
                          i18n.tr("<u>Multiply</u><br/>") +
                          i18n.tr("• Tap on a row to select it<br/>") +
                          i18n.tr("• The multiply header will show<br/>") +
                          i18n.tr("• Hold and move the slider increase/decrease the value of the mutliplicator, release to multiply<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: i18n.tr("In Switch, there are two ways to solve a matrix:<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                RowLayout {
                    width: parent.width
                    spacing: units.dp(16)

                    Label {
                        Layout.fillWidth: true
                        text: i18n.tr("1. Transform the matrix into upper <a href='https://en.wikipedia.org/wiki/Triangular_matrix'>triangular form</a> using the row operations. ") +
                              i18n.tr("Click on the 'Solve' button when you think you know the solution.<br/>") +
                              i18n.tr("⊕ time efficient for small matrices<br/>") +
                              i18n.tr("⊕ train your mental arithmetic skills<br/>") +
                              i18n.tr("⊖ difficult for bigger matrices<br/>") +
                              i18n.tr("↳ recommended for smaller matrices")
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
                        text: i18n.tr("2. Simplify the matrix as much as possible by using the row operations. ")+
                              i18n.tr("You will end up with the so called reduced <a href='https://en.wikipedia.org/wiki/Row_echelon_form'>row echelon form</a> and Switch will detect that the matrix is solved.<br/>") +
                              i18n.tr("⊕ easy on the brain (no need for mental arithmetic)<br/>") +
                              i18n.tr("⊖ wastefully time consuming for smaller matrices<br/>") +
                              i18n.tr("↳ recommended for big matrices")
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
                    text: i18n.tr("”The problem is choice.”")
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
                    text: i18n.tr("– <i>Neo</i>")
                }
            }
        },
        Component {
            TutorialColumn {
                swipingEnabled: !multiplyHeader.isDragActive
                spacing: units.dp(8)

                Label {
                    text: i18n.tr("Let's go")
                    fontSize: "x-large"
                }

                Label {
                    text: i18n.tr("I think it's time to try it yourself.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }


                Label {
                    text: i18n.tr("As soon as you think you got it, you can <a href='#'>check your solution</a>. ")+
                          i18n.tr("Or, alternatively, simplify it to the very end and Switch will handle the rest.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: UbuntuColors.orange
                    onLinkActivated: {
                        PopupUtils.open(solveDialogComponent);
                    }
                }

                MatrixWidget {
                    id: matrixWidget
                    anchors.horizontalCenter: parent.horizontalCenter
                    matrix: [
                        [1, 1, 3],
                        [1, -1, 1]
                    ]
                    onSolved: {
                        PopupUtils.open(successDialogComponent);
                    }
                }

                MultiplyHeader {
                    id: multiplyHeader
                    matrixWidget: matrixWidget
                }

                Label {
                    text: i18n.tr("<u>Hint:</u> The variables in Switch are called X1, X2, X3 ... XN (e.g. instead of x, y, z). ") +
                          i18n.tr("The reason for this is simply that there will be more than just 3 variables in the game and this naming scheme is more consistent therefore.")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Label {
                    text: i18n.tr("No idea what to do? <a href='#'>Go back to the explanations</a>.")
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
                            solution: [2, 1]
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
                        title: i18n.tr("Success!")
                        text: i18n.tr("Are you ready for more?")
                        Button {
                            text: i18n.tr("Continue")
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
                        title: i18n.tr("Hmmm ...")
                        text: i18n.tr("This is not the correct solution. Try again!")
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
}
