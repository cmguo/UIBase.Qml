#ifndef MODEL_H
#define MODEL_H

#include "Printer_global.h"
#include "filament.h"

#include <QObject>
#include <QVariantList>

class BBLPrinter;

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
    Q_PROPERTY(QVariantList plates READ plates CONSTANT)
    Q_PROPERTY(QVariantList filaments READ filaments CONSTANT)

public:
    Model();

    Model(BBLPrinter & printer);

public:
    QString url() const;
    QString title() const;
    long timeEstimate() const;
    QVariantList plates() const;
    QVariantList filaments() const;

private:
    BBLPrinter * printer_ = nullptr;
};

#endif // MODEL_H
