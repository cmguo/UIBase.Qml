#include "statecolors.h"
#include "bamboo/statecolors.h"

#include <QQmlEngine>

void StateColors::init()
{
    QMetaType::registerConverter<QString, StateColor*>([](QString color) {
        return inst().get(color.toUtf8());
    });
}

StateColors &StateColors::inst()
{
    static StateColors c;
    return c;
}


StateColors::StateColors(QObject *parent)
    : QObject(parent)
{
    setObjectName("StateColors");
    defineColors();
    for (auto c : colors_) {
        QQmlEngine::setObjectOwnership(c, QQmlEngine::CppOwnership);
    }
}

StateColor *StateColors::get(QByteArray const & name)
{
    if (name.isEmpty())
        return nullptr;
    auto c = colors_.value(name);
    if (c == nullptr) {
        c = new StateColor(name);
        if (c->stdColorCnt()) {
            QQmlEngine::setObjectOwnership(c, QQmlEngine::CppOwnership);
            c->setObjectName(name);
            colors_.insert(name, c);
        } else if (c->count() == 0) {
            delete c;
            c = nullptr;
        }
    }
    return c;
}
