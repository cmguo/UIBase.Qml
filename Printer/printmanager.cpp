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
    registerListContainerConverters<QList, Plate>();
    registerListContainerConverters<QList, Filament>();
    heaters_.append(new Heater("bed", printer.heatbed_cur_temp, printer.heatbed_tgt_temp, this));
    heaters_.append(new Heater("end", printer.hotend_cur_temp, printer.hotend_tgt_temp, this));
    heaters_.append(new Heater("chamber", printer.chamber_temp, printer.chamber_temp, this));
    fans_.append(new CoolingFan(printer, tr("机箱风箱"), true, printer.chamber_fan_on, this));
    fans_.append(new CoolingFan(printer, tr("打印大风箱"), true, printer.print_fan_on, this));
    fans_.append(new CoolingFan(printer, tr("打印小风箱"), false, printer.print_fan2_on, this));
    fans_.append(new CoolingFan(printer, tr("热端风箱"), false, printer.end_fan_on, this));
    axisController_ = new AxisController(printer_, this);
    connect(&printer, &BBLPrinter::changed, this, &PrintManager::notifyUpdateAll);

    currentTask_ = new PrintTask(printer);
}

void PrintManager::print(const Model &model)
{
    if (currentTask_)
        delete currentTask_;
    currentTask_ = nullptr;
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
    return printer_.chamber_led_on;
}

void PrintManager::setLightOn(bool on)
{
    printer_.moduleControl(&printer_.chamber_led_on, on);
    emit isLightOnChanged();
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
    return currentTask_;
}

void PrintManager::notifyUpdateAll()
{
    for (auto & h : heaters_)
        h->notifyUpdateAll();
    for (auto & h : fans_)
        h->notifyUpdateAll();
    if (currentTask_)
        currentTask_->notifyUpdateAll();
}
