#include "demo.h"

#define QZXING_QML
#include <QZXing.h>

#include <uibase.h>

void Demo::init(QQmlEngine & engine)
{
    UIBase::init();
    QZXing::registerQMLTypes();
    QZXing::registerQMLImageProvider(engine);
}
