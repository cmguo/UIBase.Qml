#include "statecolorhandler.h"
#include "statehandler.h"

#include <QDebug>

StateColorHandler::StateColorHandler()
    : stateColor_(nullptr)
    , state_(nullptr)
{
}

StateColorHandler::StateColorHandler(StateColor *color, StateHandler *state)
    : stateColor_(nullptr)
    , state_(state)
{
    if (state)
        connect(state, &StateHandler::statesChanged, this, &StateColorHandler::onStatesChanged);
    if (color)
        setStateColor(color);
}

QColor StateColorHandler::color() const
{
    if (stateColor_ && state_)
        return stateColor_->colorForStates(state_->states());
    else
        return Qt::transparent;
}

StateColor *StateColorHandler::stateColor() const
{
    return stateColor_;
}

void StateColorHandler::setStateColor(StateColor *stateColor)
{
    if (stateColor && state_ == nullptr) {
        state_ = StateHandler::bindTo(parent());
        connect(state_, &StateHandler::statesChanged, this, &StateColorHandler::onStatesChanged);
    }
    if (stateColor != stateColor_) {
        if (stateColor_)
            stateColor_->disconnect(this);
        stateColor_ = stateColor;
        if (stateColor_) {
            connect(stateColor_, &StateColor::changed, this, [this]() {
                emit changed(color());
            });
            connect(stateColor_, &StateColor::destroyed, this, [this]() {
                // qDebug() << "StateColor::destroyed" << stateColor_->objectName();
                if (stateColor_ == sender())
                    setStateColor(nullptr);
            });
        }
        emit changed(color());
    }
}

void StateColorHandler::onStatesChanged(int states)
{
    if (stateColor_ && (states & stateColor_->states())) {
        // qDebug() << "onStatesChanged" << stateColor_->objectName() << (StateColor::State)states;
        emit changed(color());
    }
}
