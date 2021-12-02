#include "heater.h"

Heater::Heater(QObject *parent)
    : QObject(parent)
{
}

QByteArray Heater::name() const
{
    return nullptr;
}

float Heater::targetTemp() const
{
    return 0;
}

void Heater::setTargetTemp(float value)
{
}

float Heater::currentTemp() const
{
    return 0;
}
