#include "coolingfan.h"

CoolingFan::CoolingFan(QObject *parent)
    : QObject(parent)
{
}

QByteArray CoolingFan::name() const
{
    return nullptr;
}

QString CoolingFan::title() const
{
    return nullptr;
}

bool CoolingFan::isOn() const
{
    return 0;
}

void CoolingFan::setOn(bool on)
{
}
