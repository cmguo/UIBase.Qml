#ifndef STATELISTCOLORS_H
#define STATELISTCOLORS_H

#include "statelistcolor.h"

#include <QObject>
#include <QVariant>

class StateListColors : public QObject
{
    Q_OBJECT
    Q_PROPERTY(StateListColor* blue_100_pressed_disabled READ blue_100_pressed_disabled CONSTANT);
public:
    static StateListColors & inst();

private:
    explicit StateListColors(QObject *parent = nullptr);

public slots:
    StateListColor * blue_100_pressed_disabled() const {
        return colors_["blue_100_pressed_disabled"];
    }

private:
    template<typename ...Colors>
    void defineColor(char const * name, QPair<Colors, int>... colors) {
        colors_.insert(name, new StateListColor(colors...));
    }

private:
    QMap<QByteArray, StateListColor*> colors_;
};

#endif // STATELISTCOLORS_H
