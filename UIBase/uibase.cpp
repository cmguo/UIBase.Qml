#include "uibase.h"
#include "uibase/destiny.h"
#include "uibase/colors.h"
#include "uibase/statehandler.h"
#include "uibase/statelistcolor.h"
#include "uibase/statelistcolors.h"
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
    StateListColors::init();
    qmlRegisterSingletonType<StateListColors>("UIBase", 1, 0, "StateListColors",
                                              [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&StateListColors::inst(), QQmlEngine::CppOwnership);
        return &StateListColors::inst();
    });
#endif

    qmlRegisterType<StateHandler>("UIBase", 1, 0, "StateHandler");
    qmlRegisterType<StateColor>("UIBase", 1, 0, "StateColor");
    qmlRegisterType<StateListColor>("UIBase", 1, 0, "StateListColor");

    qmlRegisterType<ZButtonAppearance>("UIBase", 1, 0, "ZButtonAppearance");

    initialized = true;
}
