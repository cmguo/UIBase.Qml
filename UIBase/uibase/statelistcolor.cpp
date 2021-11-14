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
    return *this;
}

StateListColor &StateListColor::operator()(StdColor color, int states)
{
    statesList_.append(states);
    colors_.append(nullptr);
    stdColors_.append(color);
    if (++stdColorCnt_ == 1) {
        connect(&Colors::inst(), &Colors::changed, this, &StateListColor::changed);
    }
    return *this;
}

QColor StateListColor::color() const
{
    return colorForStates(0);
}

QColor StateListColor::colorForStates(int states) const
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
    auto update = [this]() {
        emit changed(this->color());
    };
    connect(state, &StateHandler::statesChanged, this, update);
    connect(color, &StateListColor::changed, this, update);
}

QColor StateColor::color() const
{
    if (color_ && state_)
        return color_->colorForStates(state_->states());
    else
        return QColor();
}
