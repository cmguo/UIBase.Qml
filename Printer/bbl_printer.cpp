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

void BBLPrinter::moduleControl(bool * state, bool on)
{
    MODULE module = static_cast<MODULE>(state - &print_fan_on);
    qDebug() << "moduleControl" << module << on;
    switch (module) {
    case MODULE_PRINT_FAN:
        print_fan_on = on;
        break;
    case MODULE_CHAMBER_FAN:
        chamber_fan_on = on;
        break;
    case MODULE_CHAMBER_LED:
        chamber_led_on = on;
        break;
    }
}
