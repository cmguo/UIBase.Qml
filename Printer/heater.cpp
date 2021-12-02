#include "heater.h"

Heater::Heater(QObject *parent)
    : QObject(parent)
{
}

QByteArray Heater::name() const
{
    return nullptr;
}

QString Heater::icon() const
{
    return nullptr;
}

static float t = 0;

float Heater::targetTemp() const
{
    return t;
}

void Heater::setTargetTemp(float value)
{
    t = value;
    emit targetTempChanged();
}

float Heater::currentTemp() const
{
    return 0;
}
