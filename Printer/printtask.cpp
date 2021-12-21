#include "bbl_printer.h"
#include "printtask.h"

PrintTask::PrintTask(QObject *parent)
    : QObject(parent)
    , printer_(*(BBLPrinter *)nullptr)
{
}

PrintTask::PrintTask(BBLPrinter & printer, QObject *parent)
    : QObject(parent)
    , printer_(printer)
{
}

QVariant PrintTask::model() const
{
    return QVariant::fromValue(Model(printer_));
}

int PrintTask::currentPlate() const
{
    return 0;
}

long PrintTask::totalTime() const
{
    float p = progress();
    if (p < 0.0001)
        return 0;
    return static_cast<long>(QByteArray(printer_.gcode_duration.c_str()).toFloat() / p);
}

float PrintTask::progress() const
{
    return QByteArray(printer_.gcode_progress.c_str()).toFloat() / 100;
}

PrintTask::PrintStep PrintTask::printStep() const
{
    return static_cast<PrintStep>(QByteArray(printer_.gcode_state.c_str()).toInt());
}

void PrintTask::printPlate(int index)
{
}

void PrintTask::notifyUpdateAll()
{
    emit progressChanged();
    emit totalTimeChanged();
    emit printStepChanged();
}
