#include "statelistcolors.h"
#include "bamboo/statelistcolors.h"

#include <QQmlEngine>

void StateListColors::init()
{
    QMetaType::registerConverter<QString, StateListColor*>([](QString color) {
        return inst().get(color.toUtf8());
    });
}

StateListColors &StateListColors::inst()
{
    static StateListColors c;
    return c;
}


StateListColors::StateListColors(QObject *parent)
    : QObject(parent)
{
    setObjectName("StateListColors");
    defineColors();
    for (auto c : colors_) {
        QQmlEngine::setObjectOwnership(c, QQmlEngine::CppOwnership);
    }
}

StateListColor *StateListColors::get(QByteArray const & name)
{
    if (name.isEmpty())
        return nullptr;
    auto c = colors_.value(name);
    if (c == nullptr) {
        c = new StateListColor(name);
        if (c->stdColorCnt()) {
            QQmlEngine::setObjectOwnership(c, QQmlEngine::CppOwnership);
            colors_.insert(name, c);
        } else if (c->count() == 0) {
            delete c;
            c = nullptr;
        }
    }
    return c;
}
