#include "uibase.h"
#include "uibase/destiny.h"
#include "uibase/colors.h"
#include "uibase/statehandler.h"
#include "uibase/statelistcolor.h"
#include "uibase/statelistcolors.h"

#include <QQmlEngine>

#include <uibase/zbuttonappearance.h>

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

    qmlRegisterSingletonInstance<Colors>("UIBase", 1, 0, "Colors", &Colors::inst());
    qmlRegisterSingletonInstance<StateListColors>("UIBase", 1, 0, "StateListColors", &StateListColors::inst());

    qmlRegisterType<StateHandler>("UIBase", 1, 0, "StateHandler");
    qmlRegisterType<StateColor>("UIBase", 1, 0, "StateColor");
    qmlRegisterType<StateListColor>("UIBase", 1, 0, "StateListColor");

    qmlRegisterType<ZButtonAppearance>("UIBase", 1, 0, "ZButtonAppearance");

    initialized = true;
}
