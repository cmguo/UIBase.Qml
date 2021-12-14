#include "axiscontroller.h"
#include "bbl_printer.h"

AxisController::AxisController(QObject *parent)
    : QObject(parent)
    , printer_(*(BBLPrinter*)nullptr)
{
}

AxisController::AxisController(BBLPrinter &printer, QObject *parent)
    : QObject(parent)
    , printer_(printer)
{
}

void AxisController::moveAxis(Axis axis, Direction dir, Unit unit)
{
    printer_.moveAxis(axis, dir, unit);
}
