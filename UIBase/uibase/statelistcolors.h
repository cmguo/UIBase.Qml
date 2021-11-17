#ifndef STATELISTCOLORS_H
#define STATELISTCOLORS_H

#include "statelistcolor.h"

#include <QObject>
#include <QVariant>

class StateListColors : public QObject
{
    Q_OBJECT
public:
    static void init();

    static StateListColors & inst();

private:
    explicit StateListColors(QObject *parent = nullptr);

public slots:
    StateListColor * get(QByteArray const & name);

private:
    template<typename ...Colors>
    void defineColor(char const * name, QPair<Colors, int>... colors) {
        colors_.insert(name, new StateListColor(colors...));
    }

private:
    QMap<QByteArray, StateListColor*> colors_;
};

#endif // STATELISTCOLORS_H
