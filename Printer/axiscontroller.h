#ifndef AXISCONTROLLER_H
#define AXISCONTROLLER_H

#include "Printer_global.h"

#include <QObject>

class BBLPrinter;

class PRINTER_EXPORT AxisController : public QObject
{
    Q_OBJECT

public:
    enum Axis {
        AxisX,
        AxisY,
        AxisZ,
        AxisE
    };

    Q_ENUM(Axis)

    enum Direction {
        Increase,
        Decrease
    };

    Q_ENUM(Direction)

    enum Unit {
        MM_1_10,
        MM,
        MM_10,
    };

    Q_ENUM(Unit)

public:
    explicit AxisController(QObject *parent = nullptr);

    explicit AxisController(BBLPrinter &printer, QObject *parent = nullptr);

public slots:
    void moveAxis(AxisController::Axis axis, AxisController::Direction dir, AxisController::Unit unit);

private:
    BBLPrinter &printer_;
};

#endif // AXISCONTROLLER_H
