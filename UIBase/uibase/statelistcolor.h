#ifndef STATELISTCOLOR_H
#define STATELISTCOLOR_H

#include "colors.h"

#include <QObject>
#include <QColor>
#include <QVector>
#include <QPair>
#include <QQmlListProperty>

class StateListColorItem: public QObject
{
    Q_OBJECT

    Q_PROPERTY(int states MEMBER states_)
    Q_PROPERTY(QByteArray color MEMBER color_)
public:
    StateListColorItem();
private:
    int states_;
    QByteArray color_;
};

class StateListColor: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<StateListColorItem> colors READ colors)
    Q_CLASSINFO("DefaultProperty", "colors")

public:
    typedef QColor (Colors::* StdColor)(void) const;

    template<typename ...Colors>
    StateListColor(QPair<Colors, int>... colors) {
        fill(colors...);
    }

    // single color
    StateListColor(QColor color);

    // single color
    StateListColor(StdColor color);

signals:
    void changed();

public:
    StateListColor & operator()(QColor color, int states);

    StateListColor & operator()(StdColor color, int states);

    int states() const { return states_; }

    QQmlListProperty<StateListColorItem> colors();

public slots:
    QColor color();

    QColor colorForStates(int states);

private:
    template<typename Color, typename ...Colors>
    void fill(QPair<Color, int> color, QPair<Colors, int>... colors) {
        fill(color);
        fill(colors...);
    }

    void fill(QPair<QColor, int> color) {
        (*this)(color.first, color.second);
    }

    void fill(QPair<StdColor, int> color) {
        (*this)(color.first, color.second);
    }

    void fill() {
    }

private:
    QVector<int> statesList_;
    QVector<QColor> colors_;
    QVector<StdColor> stdColors_;
    int stdColorCnt_ = 0;
    int states_ = 0;
};

class StateHandler;

class StateColor : public QObject
{
    Q_OBJECT

    Q_PROPERTY(StateListColor* colors READ colors WRITE setColors NOTIFY changed)
    Q_PROPERTY(QColor color READ color NOTIFY changed)
public:
    StateColor();

    StateColor(StateListColor * color, StateHandler * state);

signals:
    void changed(QColor color);

public:
    QColor color() const;

    StateListColor* colors() const;

    void setColors(StateListColor* colors);

private:
    void onStatesChanged(int states);

private:
    StateListColor * color_;
    StateHandler * state_;
};

#endif // STATELISTCOLOR_H
