#include "statehandler.h"
#include "statelistcolor.h"

StateListColor::StateListColor(QColor color)
{
    append(color, 0);
}

StateListColor::StateListColor(StdColor color)
{
    append(color, 0);
}

StateListColor::StateListColor(const QByteArray &color)
{
    append(color, 0);
}

void StateListColor::append(QColor color, int states)
{
    statesList_.append(states);
    colors_.append(color);
    stdColors_.append(nullptr);
    states_ |= states;
}

void StateListColor::append(StdColor color, int states)
{
    statesList_.append(states);
    colors_.append(nullptr);
    stdColors_.append(color);
    if (++stdColorCnt_ == 1) {
        connect(&Colors::inst(), &Colors::changed, this, &StateListColor::changed);
    }
    states_ |= states;
}

void StateListColor::append(const QByteArray &color, int states)
{
    StdColor c = Colors::inst().stdColor(color);
    if (c) {
        append(c, states);
    } else {
        QColor c1(color.data());
        if (c1.isValid()) {
            append(c1, states);
        }
    }
}

void StateListColor::append(StateListColorItem *item)
{
    append(item->color(), item->states());
}

void StateListColor::clear()
{
    statesList_.clear();
    colors_.clear();
    stdColors_.clear();
    if (stdColorCnt_ > 0)
        Colors::inst().disconnect(this);
    stdColorCnt_ = 0;
    states_ = 0;
}

static void appendColor(QQmlListProperty<StateListColorItem>*list, StateListColorItem*p) {
    reinterpret_cast< StateListColor* >(list->data)->append(p);
}
static int colorCount(QQmlListProperty<StateListColorItem>*list) {
    return reinterpret_cast< StateListColor* >(list->data)->count();
}
static StateListColorItem* colorAt(QQmlListProperty<StateListColorItem>*, int) {
    return nullptr;
}
static void clearColors(QQmlListProperty<StateListColorItem>*list) {
    reinterpret_cast< StateListColor* >(list->data)->clear();
}

QQmlListProperty<StateListColorItem> StateListColor::colors()
{
    return {this, this,
                 &appendColor,
                 &colorCount,
                 &colorAt,
                 &clearColors};
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
