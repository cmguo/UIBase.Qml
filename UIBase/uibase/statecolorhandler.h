#ifndef STATECOLORHANDLER_H
#define STATECOLORHANDLER_H

#include "statecolor.h"

#include <QObject>

class StateHandler;

class StateColorHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(StateColor* stateColor READ stateColor WRITE setStateColor NOTIFY changed)
    Q_PROPERTY(QColor color READ color NOTIFY changed)
public:
    StateColorHandler();

    StateColorHandler(StateColor * color, StateHandler * state);

signals:
    void changed(QColor color);

public:
    QColor color() const;

    StateColor* stateColor() const;

    void setStateColor(StateColor* stateColor);

private:
    void onStatesChanged(int states);

private:
    StateColor * stateColor_;
    StateHandler * state_;
};

#endif // STATECOLORHANDLER_H
