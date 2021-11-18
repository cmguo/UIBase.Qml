#include "statehandler.h"

#include <QEvent>
#include <QQuickItem>

StateHandler::StateHandler(QObject *parent)
    : QObject(parent)
    , item_(nullptr)
{

}

StateHandler* StateHandler::bindTo(QObject *parent)
{
    StateHandler * handler = parent->findChild<StateHandler*>();
    if (handler == nullptr) {
        handler = new StateHandler(parent);
        handler->bindTo(qobject_cast<QQuickItem*>(parent));
    }
    return handler;
}

int StateHandler::states() const
{
    return states_;
}

StateColor *StateHandler::mapColor(StateListColor *color)
{
    bindTo(qobject_cast<QQuickItem*>(parent()));
    if (color == nullptr)
        return nullptr;
    return new StateColor(color, this);
}

void StateHandler::onEnabledChanged()
{
    onStateChanged(Enabled, item_->isEnabled());
}

void StateHandler::onCheckedChanged()
{
    onStateChanged(Checked, item_->property("checked").toBool());
}

void StateHandler::onPressedChanged()
{
    onStateChanged(Pressed, tapHandler_->property("pressed").toBool());
}

void StateHandler::onHoveredChanged()
{
    onStateChanged(Hovered, hoverHandler_->property("hovered").toBool());
}

void StateHandler::onStateChanged(State state, bool value)
{
    qDebug() << "onStateChanged" << state << value;
    if (((states_ & state) == 0) == value) {
        states_ ^= state;
        emit statesChanged(state);
    }
}

void StateHandler::bindTo(QQuickItem *item)
{
    if (item_ == item)
        return;
    for (auto & c : conns_)
        disconnect(c);
    conns_.clear();
    states_ = 0;
    item_ = item;
    if (item_ == nullptr)
        return;
    if (item->isEnabled()) {
        states_ |= Enabled;
    }
    conns_.append(connect(item, &QQuickItem::enabledChanged, this, &StateHandler::onEnabledChanged));
    int ichecked = item->metaObject()->indexOfProperty("checked");
    if (ichecked > 0) {
        QMetaProperty checked = item->metaObject()->property(ichecked);
        if (checked.hasNotifySignal()) {
            if (checked.read(item).toBool())
                states_ |= Checked;
            int i = metaObject()->indexOfMethod("onCheckedChanged()");
            connect(item, checked.notifySignal(), this, metaObject()->method(i));
        }
    }
    QByteArray TapHandler{"QQuickTapHandler"};
    QByteArray HoverHandler{"QQuickHoverHandler"};
    for (auto c : item->children()) {
        if (tapHandler_ != nullptr && TapHandler == c->metaObject()->className()) {
            if (c->property("pressed").toBool())
                states_ |= Pressed;
            connect(c, SIGNAL(pressedChanged()), this, SLOT(onPressedChanged()));
            tapHandler_ = c;
        } else if (hoverHandler_ != nullptr && HoverHandler == c->metaObject()->className()) {
            if (c->property("hovered").toBool())
                states_ |= Hovered;
            connect(c, SIGNAL(hoveredChanged()), this, SLOT(onHoveredChanged()));
            hoverHandler_ = c;
        }
    }
}
