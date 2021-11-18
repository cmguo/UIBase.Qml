#ifndef STATECOLORS_H
#define STATECOLORS_H

#include "statecolor.h"

#include <QObject>
#include <QVariant>

class StateColors : public QObject
{
    Q_OBJECT
public:
    static void init();

    static StateColors & inst();

    typedef StateColor::State State;

private:
    explicit StateColors(QObject *parent = nullptr);

public slots:
    StateColor * get(QByteArray const & name);

private:
    void defineColors();

    template<typename ...Colors>
    void defineColor(char const * name, QPair<Colors, int>... colors) {
        colors_.insert(name, new StateColor(colors...));
    }

private:
    QMap<QByteArray, StateColor*> colors_;
};

#endif // STATECOLORS_H
