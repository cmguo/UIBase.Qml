#ifndef MODEL_H
#define MODEL_H

#include "Printer_global.h"
#include "filament.h"

#include <QObject>

class PRINTER_EXPORT Plate
{
    Q_GADGET

    Q_PROPERTY(QByteArray thumnail READ thumnail CONSTANT)
    Q_PROPERTY(QColor color READ color CONSTANT)
    Q_PROPERTY(bool finished READ finished CONSTANT)

public:
    QByteArray thumnail() const;
    QColor color() const;
    bool finished() const;
};

class PRINTER_EXPORT Model
{
    Q_GADGET

    Q_PROPERTY(QString url READ url CONSTANT)
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(long timeEstimate READ timeEstimate CONSTANT)
    Q_PROPERTY(QList<Plate> plates READ plates CONSTANT)
    Q_PROPERTY(QList<Filament> filaments READ filaments CONSTANT)

public:
    Model();

public:
    QString url() const;
    QString title() const;
    long timeEstimate() const;
    QList<Plate> plates() const;
    QList<Filament> filaments() const;
};

#endif // MODEL_H
