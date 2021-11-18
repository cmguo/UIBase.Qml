#include "uibase.h"
#include "uibase/destiny.h"
#include "uibase/colors.h"
#include "uibase/statehandler.h"
#include "uibase/statecolor.h"
#include "uibase/statecolors.h"
#include "widgets/zbuttonappearance.h"

#include <QQmlEngine>

void UIBase::init()
{
    static bool initialized = false;
    if (initialized) {
        return;
    }

    qmlRegisterSingletonType<Destiny>("UIBase", 1, 0, "Destiny", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject* {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        Destiny *obj = new Destiny();
        return obj;
    });

#if QT_VERSION >= QT_VERSION_CHECK(5, 15, 0)
    qmlRegisterSingletonInstance<Colors>("UIBase", 1, 0, "Colors", &Colors::inst());
    qmlRegisterSingletonInstance<StateListColors>("UIBase", 1, 0, "StateListColors", &StateListColors::inst());
#else
    qmlRegisterSingletonType<Colors>("UIBase", 1, 0, "Colors",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&Colors::inst(), QQmlEngine::CppOwnership);
        return &Colors::inst();
    });
    StateColors::init();
    qmlRegisterSingletonType<StateColors>("UIBase", 1, 0, "StateListColors",
                                              [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&StateColors::inst(), QQmlEngine::CppOwnership);
        return &StateColors::inst();
    });
#endif

    qmlRegisterType<StateHandler>("UIBase", 1, 0, "StateHandler");
    qmlRegisterType<StateColorHandler>("UIBase", 1, 0, "StateColorHandler");
    qmlRegisterType<StateColor>("UIBase", 1, 0, "StateColor");
    qmlRegisterType<StateColorItem>("UIBase", 1, 0, "StateColorItem");

    qmlRegisterType<ZButtonAppearance>("UIBase", 1, 0, "ZButtonAppearance");

    qmlRegisterSingletonType(QUrl("qrc:/uibase/qml/view/Fonts.qml"), "UIBase", 1, 0, "Fonts");

    initialized = true;
}
