#include "bbl_printer.h"

#include <QDebug>

BBLPrinter::BBLPrinter()
{

}

BBLPrinter &BBLPrinter::inst()
{
    static BBLPrinter inst;
    return inst;
}

void BBLPrinter::moveAxis(AxisController::Axis axis, AxisController::Direction dir, AxisController::Unit unit)
{
    qDebug() << "moveAxis" << axis << dir << unit;
}
