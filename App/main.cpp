#include <QFileInfo>
#include <QGuiApplication>
#include <QQmlFileSelector>
#include <QQuickItem>
#include <QQuickView>

#include <demo.h>
#include <printerui.h>

// #define ROTATE_SCREEN -90

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc,argv);
    app.setOrganizationName("QtProject");
    app.setOrganizationDomain("qt-project.org");
    app.setApplicationName(QFileInfo(app.applicationFilePath()).baseName());
    QQuickView view;
    PrinterUI::init(*view.engine());
    if (qEnvironmentVariableIntValue("QT_QUICK_CORE_PROFILE")) {
        QSurfaceFormat f = view.format();
        f.setProfile(QSurfaceFormat::CoreProfile);
        f.setVersion(4, 4);
        view.setFormat(f);
    }
    if (qEnvironmentVariableIntValue("QT_QUICK_MULTISAMPLE")) {
        QSurfaceFormat f = view.format();
        f.setSamples(4);
        view.setFormat(f);
    }
    view.connect(view.engine(), &QQmlEngine::quit, &app, &QCoreApplication::quit);
    new QQmlFileSelector(view.engine(), &view);
    view.setSource(QUrl("qrc:///printerui/qml/Screen.qml"));
    if (view.status() == QQuickView::Error)
        return -1;
    int rotate = qEnvironmentVariableIntValue("QT_QUICK_ROTATE_SCREEN");
    if (rotate == 0) {
        view.setResizeMode(QQuickView::SizeRootObjectToView);
    } else {
        QQuickItem * root = view.rootObject();
        QSizeF size{root->width(), root->height()};
        view.resize(size.height(), size.width());
        if (rotate == 90) {
            root->setTransformOriginPoint({size.height() / 2, size.height() / 2});
            root->setRotation(90);
        } else {
            struct MyTransform : public QQuickTransform {
                MyTransform(QSizeF size) {
                    tr_.rotate(270);
                    tr_ *= QTransform::fromTranslate(0, size.width());
                }
                virtual void applyTo(QMatrix4x4 *matrix) const
                {
                    *matrix = *matrix * tr_;
                }
                QTransform tr_;
            };
            (new MyTransform(size))->appendToItem(root);
        }
    }
    view.show();
    return app.exec();
}
