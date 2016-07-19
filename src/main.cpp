#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QColor>
#include <QObject>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    QObject::connect(view.engine(), SIGNAL(quit()), QGuiApplication::instance(), SLOT(quit()));
    view.engine()->addImportPath(".");
    view.engine()->rootContext()->setContextProperty("themeColor", QColor("#009688"));
    view.engine()->rootContext()->setContextProperty("themeColorGradientEnd", QColor("#078d7f"));
    view.engine()->rootContext()->setContextProperty("themeColorLight", QColor("#B2DFDB"));
    view.engine()->rootContext()->setContextProperty("accentColor", QColor("#00BCD4"));
    view.engine()->rootContext()->setContextProperty("accentColorLight", QColor("#B2EBF2"));
    view.engine()->rootContext()->setContextProperty("dangerColor", QColor("#FF5252"));
    view.engine()->rootContext()->setContextProperty("warningColor", QColor("#FFC107"));
    view.engine()->rootContext()->setContextProperty("warningColorLight", QColor("#FFECB3"));
    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();
    return app.exec();
}

