#ifndef FILAMENT_H
#define FILAMENT_H

#include "Printer_global.h"

#include <QColor>
#include <QObject>

class PRINTER_EXPORT Filament
{
    Q_GADGET

    Q_PROPERTY(QByteArray name READ name CONSTANT)
    Q_PROPERTY(QByteArray meterial READ meterial CONSTANT)
    Q_PROPERTY(QColor color READ color CONSTANT)
    Q_PROPERTY(long weight READ weight CONSTANT)

public:
    Filament();

public:
    QByteArray name() const;
    QByteArray meterial() const;
    QColor color() const;
    long weight() const;
};

#endif // FILAMENT_H
