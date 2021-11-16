#ifndef STATELISTCOLOR_H
#define STATELISTCOLOR_H

#include "colors.h"

#include <QObject>
#include <QColor>
#include <QVector>
#include <QPair>

class StateListColor: public QObject
{
    Q_OBJECT
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

public slots:
    QColor color() const;

    QColor colorForStates(int states) const;

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
    int stdColorCnt_;
};

class StateHandler;

class StateColor : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor color READ color NOTIFY changed)
public:
    StateColor();

    StateColor(StateListColor * color, StateHandler * state);

signals:
    void changed(QColor color);

public:
    QColor color() const;

private:
    StateListColor * color_;
    StateHandler * state_;
};

#endif // STATELISTCOLOR_H
