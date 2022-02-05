#include "uibase.h"
#include "uibase/destiny.h"
#include "uibase/colors.h"
#include "uibase/statehandler.h"
#include "uibase/statecolor.h"
#include "uibase/statecolors.h"
#include "uibase/effectimageprovider.h"
#include "widgets/zbuttonappearance.h"

#include <QQmlEngine>

#include <widgets/zprogressbarappearance.h>
#include <widgets/zstepindicator.h>
#include <widgets/zswitchbuttonappearance.h>
#include <widgets/ztextinputappearance.h>

void UIBase::init(QQmlEngine & engine)
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
    qmlRegisterSingletonInstance<StateColors>("UIBase", 1, 0, "StateColors", &StateColors::inst());
#else
    qmlRegisterSingletonType<Colors>("UIBase", 1, 0, "Colors",
                                     [](QQmlEngine*, QJSEngine*) -> QObject* {
        QQmlEngine::setObjectOwnership(&Colors::inst(), QQmlEngine::CppOwnership);
        return &Colors::inst();
    });
    StateColors::init();
    qmlRegisterSingletonType<StateColors>("UIBase", 1, 0, "StateColors",
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
    qmlRegisterType<ZTextInputAppearance>("UIBase", 1, 0, "ZTextInputAppearance");
    qmlRegisterType<ZSwitchButtonAppearance>("UIBase", 1, 0, "ZSwitchButtonAppearance");
    qmlRegisterType<ZProgressBarAppearance>("UIBase", 1, 0, "ZProgressBarAppearance");
    qmlRegisterType<ZStepIndicator>("UIBase", 1, 0, "ZStepIndicator");

    for (auto t : {"Fonts"})
        qmlRegisterSingletonType(QUrl("qrc:/uibase/qml/view/" + QByteArray(t) + ".qml"), "UIBase", 1, 0, t);

    for (auto t : {"ZButton", "ZText", "ZTextInput", "ZProgressBar", "ZSwitchButton", "ZStepBar"})
        qmlRegisterType(QUrl("qrc:/uibase/qml/widgets/" + QByteArray(t) + ".qml"), "UIBase", 1, 0, t);

    engine.addImageProvider(QLatin1String("effect"), new EffectImageProvider);

    initialized = true;
}
