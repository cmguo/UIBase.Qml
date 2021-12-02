#include "printtask.h"

PrintTask::PrintTask(QObject *parent)
    : QObject(parent)
{
}

Model PrintTask::model() const
{
    return {};
}

int PrintTask::currentPlate() const
{
    return 0;
}

long PrintTask::remainTimeEstimate() const
{
    return 0;
}

PrintTask::PrintStep PrintTask::printStep() const
{
    return Idle;
}

void PrintTask::printPlate(int index)
{
}
