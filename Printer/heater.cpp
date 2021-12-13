#include "heater.h"

#include <QVariant>

Heater::Heater(std::string const & name, std::string const & currentTemp,
               std::string const & targetTemp, QObject *parent)
    : QObject(parent)
    , name_(name)
    , targetTemp_(targetTemp)
    , currentTemp_(currentTemp)
{
}

QByteArray Heater::name() const
{
    return name_.c_str();
}

float Heater::targetTemp() const
{
    return QVariant::fromValue(QByteArray(targetTemp_.c_str())).toFloat();
}

void Heater::setTargetTemp(float value)
{
    emit targetTempChanged();
}

void Heater::notifyUpdateAll()
{
    emit targetTempChanged();
    emit currentTempChanged();
}

float Heater::currentTemp() const
{
    return QVariant::fromValue(QByteArray(currentTemp_.c_str())).toFloat();
}
