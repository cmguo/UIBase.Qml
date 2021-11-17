#include "statehandler.h"
#include "statelistcolor.h"

StateListColor::StateListColor(QColor color)
{
    (*this)(color, 0);
}

StateListColor::StateListColor(StdColor color)
{
    (*this)(color, 0);
}

StateListColor &StateListColor::operator()(QColor color, int states)
{
    statesList_.append(states);
    colors_.append(color);
    stdColors_.append(nullptr);
    states_ |= states;
    return *this;
}

QQmlListProperty<StateListColorItem> StateListColor::colors()
{
    return {};
}

StateListColor &StateListColor::operator()(StdColor color, int states)
{
    statesList_.append(states);
    colors_.append(nullptr);
    stdColors_.append(color);
    if (++stdColorCnt_ == 1) {
        connect(&Colors::inst(), &Colors::changed, this, &StateListColor::changed);
    }
    states_ |= states;
    return *this;
}

QColor StateListColor::color()
{
    return colorForStates(0);
}

QColor StateListColor::colorForStates(int states)
{
    for (int i = 0; i < statesList_.size(); ++i) {
        int s = statesList_[i];
        int on = s & 0xffff;
        if ((on & states) == on && (s & (states << 16)) == 0) {
            auto & stdc = stdColors_[i];
            return stdc ? (Colors::inst().*stdc)() : colors_[i];
        }
    }
    return QColor();
}

StateColor::StateColor()
    : color_(nullptr)
    , state_(nullptr)
{
}

StateColor::StateColor(StateListColor *color, StateHandler *state)
    : color_(color)
    , state_(state)
{
    connect(state, &StateHandler::statesChanged, this, &StateColor::onStatesChanged);
    connect(color, &StateListColor::changed, this, [this]() {
        emit changed(this->color());
    });
}

QColor StateColor::color() const
{
    if (color_ && state_)
        return color_->colorForStates(state_->states());
    else
        return QColor();
}

StateListColor *StateColor::colors() const
{
    return color_;
}

void StateColor::setColors(StateListColor *colors)
{
    if (state_ == nullptr) {
        state_ = StateHandler::bindTo(parent());
        connect(state_, &StateHandler::statesChanged, this, &StateColor::onStatesChanged);
    }
    if (colors != color_) {
        if (color_)
            color_->disconnect(this);
        color_ = colors;
        connect(color_, &StateListColor::changed, this, [this]() {
            emit changed(color());
        });
        emit changed(color());
    }
}

void StateColor::onStatesChanged(int states)
{
    if (states & color_->states())
        emit changed(color());
}

StateListColorItem::StateListColorItem()
{

}
