#include "modelmanager.h"
#include "printmanager.h"
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
    heaters_.append(new Heater("bed", printer.heatbed_cur_temp, printer.heatbed_tgt_temp));
    heaters_.append(new Heater("end", printer.heatend_cur_temp, printer.heatend_tgt_temp));
    heaters_.append(new Heater("end", printer.chamber_temp, printer.chamber_temp));
}

void PrintManager::print(const Model &model)
{
}

QList<Heater *> PrintManager::heaters() const
{
    return heaters_;
}

QList<CoolingFan *> PrintManager::fans() const
{
    return fans_;
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
