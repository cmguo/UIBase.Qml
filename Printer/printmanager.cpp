#include "modelmanager.h"
#include "printmanager.h"


PrintManager &PrintManager::inst()
{
    static PrintManager manager;
    return manager;
}

PrintManager::PrintManager(QObject * parent)
    : QObject(parent)
{
}

void PrintManager::print(const Model &model)
{
}

QList<Heater *> PrintManager::heaters() const
{
    return {};
}

QList<CoolingFan *> PrintManager::fans() const
{
    return {};
}

bool PrintManager::isLightOn() const
{
    return false;
}

void PrintManager::setLightOn(bool on)
{
}

PrintTask *PrintManager::currentTask() const
{
    return nullptr;
}
