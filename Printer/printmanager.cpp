#include "modelmanager.h"
#include "printmanager.h"
#include "converter.h"
#include "bbl_printer.h"

PrintManager &PrintManager::inst()
{
    static PrintManager manager(BBLPrinter::inst());
    return manager;
}

PrintManager::PrintManager(BBLPrinter & printer, QObject * parent)
    : QObject(parent)
    , printer_(printer)
{
    registerListContainerConverters<QList, Heater*>();
    registerListContainerConverters<QList, CoolingFan*>();
    heaters_.append(new Heater("bed", printer.heatbed_cur_temp, printer.heatbed_tgt_temp, this));
    heaters_.append(new Heater("end", printer.hotend_cur_temp, printer.hotend_tgt_temp, this));
    heaters_.append(new Heater("chamber", printer.chamber_temp, printer.chamber_temp, this));
    axisController_ = new AxisController(printer_, this);
    connect(&printer, &BBLPrinter::changed, this, &PrintManager::notifyUpdateAll);
}

void PrintManager::print(const Model &model)
{
}

QVariantList PrintManager::heaters() const
{
    return QVariant::fromValue(heaters_).toList();
}

QVariantList PrintManager::fans() const
{
    return QVariant::fromValue(fans_).toList();
}

bool PrintManager::isLightOn() const
{
    return false;
}

void PrintManager::setLightOn(bool on)
{
}

FilamentFeeder *PrintManager::feeder() const
{
    return new FilamentFeeder;
}

AxisController *PrintManager::axisController() const
{
    return axisController_;
}

PrintTask *PrintManager::currentTask() const
{
    return nullptr;
}

void PrintManager::notifyUpdateAll()
{
    for (auto h : heaters_)
        h->notifyUpdateAll();
    for (auto h : fans_)
        h->notifyUpdateAll();
}
