#include "statehandler.h"
#include "statecolor.h"

StateColorItem::StateColorItem()
{
}

StateColor::StateColor(QColor color)
{
    append(color, 0);
}

StateColor::StateColor(StdColor color)
{
    append(color, 0);
}

StateColor::StateColor(const QByteArray &color)
{
    append(color, 0);
}

void StateColor::append(QColor color, int states)
{
    statesList_.append(states);
    colors_.append(color);
    stdColors_.append(nullptr);
    states_ |= states;
}

void StateColor::append(StdColor color, int states)
{
    statesList_.append(states);
    colors_.append(nullptr);
    stdColors_.append(color);
    if (++stdColorCnt_ == 1) {
        connect(&Colors::inst(), &Colors::changed, this, &StateColor::changed);
    }
    states_ |= states;
}

void StateColor::append(const QByteArray &color, int states)
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

void StateColor::append(StateColorItem *item)
{
    append(item->color(), item->states());
}

void StateColor::clear()
{
    statesList_.clear();
    colors_.clear();
    stdColors_.clear();
    if (stdColorCnt_ > 0)
        Colors::inst().disconnect(this);
    stdColorCnt_ = 0;
    states_ = 0;
}

static void appendColor(QQmlListProperty<StateColorItem>*list, StateColorItem*p) {
    reinterpret_cast< StateColor* >(list->data)->append(p);
}
static int colorCount(QQmlListProperty<StateColorItem>*list) {
    return reinterpret_cast< StateColor* >(list->data)->count();
}
static StateColorItem* colorAt(QQmlListProperty<StateColorItem>*, int) {
    return nullptr;
}
static void clearColors(QQmlListProperty<StateColorItem>*list) {
    reinterpret_cast< StateColor* >(list->data)->clear();
}

QQmlListProperty<StateColorItem> StateColor::colors()
{
    return {this, this,
                 &appendColor,
                 &colorCount,
                 &colorAt,
                 &clearColors};
}

QColor StateColor::color()
{
    return colorForStates(0);
}

QColor StateColor::colorForStates(int states)
{
    for (int i = 0; i < statesList_.size(); ++i) {
        int s = statesList_[i];
        int on = s & 0xffff;
        int off = s >> 16;
        if ((on & states) == on && (off & ~states) == off) {
            auto & stdc = stdColors_[i];
            return stdc ? (Colors::inst().*stdc)() : colors_[i];
        }
    }
    return Qt::transparent;
}

