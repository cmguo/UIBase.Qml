#include "printerui.h"

#include <printmanager.h>
#include <modelmanager.h>
#include <accountmanager.h>
#include <devicemanager.h>
#include <recordmanager.h>

#include <uibase.h>

#define QZXING_QML
#include <QZXing.h>

#include <QQmlEngine>

void PrinterUI::init(QQmlEngine & engine)
{
    UIBase::init();
    QZXing::registerQMLTypes();
    QZXing::registerQMLImageProvider(engine);

    qmlRegisterSingletonType<PrintManager>("Printer", 1, 0, "PrintManager",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&PrintManager::inst(), QQmlEngine::CppOwnership);
        return &PrintManager::inst();
    });
    qmlRegisterSingletonType<ModelManager>("Printer", 1, 0, "ModelManager",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&ModelManager::inst(), QQmlEngine::CppOwnership);
        return &ModelManager::inst();
    });
    qmlRegisterSingletonType<AccountManager>("Printer", 1, 0, "AccountManager",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&AccountManager::inst(), QQmlEngine::CppOwnership);
        return &AccountManager::inst();
    });
    qmlRegisterSingletonType<AccountManager>("Printer", 1, 0, "DeviceManager",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&DeviceManager::inst(), QQmlEngine::CppOwnership);
        return &DeviceManager::inst();
    });
    qmlRegisterSingletonType<RecordManager>("Printer", 1, 0, "RecordManager",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&RecordManager::inst(), QQmlEngine::CppOwnership);
        return &RecordManager::inst();
    });

    qmlRegisterType<AxisController>("Printer", 1, 0, "AxisController");
}
