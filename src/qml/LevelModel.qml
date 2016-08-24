import QtQuick 2.4
import Ubuntu.Components 1.3

ListModel {
    id: listModel
    Component.onCompleted: {
        listModel.append({
            title: i18n.tr("Spoon boy"),
            description: i18n.tr("There is no spoon."),
            color: "#00BCD4",
            solutionCount: 2,
            solutionMin: -3,
            solutionMax: 3,
            multiplierMax: 2
        });
        listModel.append({
            title: i18n.tr("Mouse"),
            description: i18n.tr("So that's why chicken tastes like everything."),
            color: "#E91E63",
            solutionCount: 2,
            solutionMin: -5,
            solutionMax: 5,
            multiplierMax: 2
        });
        listModel.append({
            title: i18n.tr("Choi"),
            description: i18n.tr("You need to unplug, man."),
            color: "#FF5722",
            solutionCount: 3,
            solutionMin: -3,
            solutionMax: 3,
            multiplierMax: 3
        });
        listModel.append({
            title: i18n.tr("Trinity"),
            description: i18n.tr("Dodge this."),
            color: "#607D8B",
            solutionCount: 3,
            solutionMin: -6,
            solutionMax: 6,
            multiplierMax: 3,
        });
        listModel.append({
            title: i18n.tr("Cypher"),
            description: i18n.tr("Ignorance is bliss."),
            color: "#7C4DFF",
            solutionCount: 3,
            solutionMin: -10,
            solutionMax: 10,
            multiplierMax: 4
        });
        listModel.append({
            title: i18n.tr("Switch"),
            description: i18n.tr("Our way... or the highway."),
            color: "#388E3C",
            solutionCount: 4,
            solutionMin: -7,
            solutionMax: 7,
            multiplierMax: 2
        });
        listModel.append({
            title: i18n.tr("Morpheus"),
            description: i18n.tr("The Matrix is everywhere."),
            color: "#FFC107",
            solutionCount: 4,
            solutionMin: -8,
            solutionMax: 8,
            multiplierMax: 3
        });
        listModel.append({
            title: i18n.tr("Agent Smith"),
            description: i18n.tr("Never send a human to do a machine's job."),
            color: "#212121",
            solutionCount: 4,
            solutionMin: -9,
            solutionMax: 9,
            multiplierMax: 3
        });
        listModel.append({
            title: i18n.tr("Neo"),
            description: i18n.tr("Whoa. Déjà vu."),
            color: "#CDDC39",
            solutionCount: 4,
            solutionMin: -10,
            solutionMax: 10,
            multiplierMax: 3
        });
        listModel.append({
            title: i18n.tr("Merovingian"),
            description: i18n.tr("I love the French language."),
            color: "#F57C00",
            solutionCount: 5,
            solutionMin: -10,
            solutionMax: 10,
            multiplierMax: 2
        });
        listModel.append({
            title: i18n.tr("Oracle"),
            description: i18n.tr("I love candy."),
            color: "#9C27B0",
            solutionCount: 5,
            solutionMin: -10,
            solutionMax: 10,
            multiplierMax: 3
        });
        listModel.append({
            title: i18n.tr("The Architect"),
            description: i18n.tr("I've been waiting for you."),
            color: "#512DA8",
            solutionCount: 5,
            solutionMin: -10,
            solutionMax: 10,
            multiplierMax: 4
        });
    }
}
