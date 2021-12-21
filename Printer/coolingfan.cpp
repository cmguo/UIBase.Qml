#include "bbl_printer.h"
#include "coolingfan.h"

CoolingFan::CoolingFan(BBLPrinter & printer, QString const & title, bool enabled, bool & state, QObject *parent)
    : QObject(parent)
    , printer_(printer)
    , state_(state)
    , title_(title)
    , enabled_(enabled)
{
}

QByteArray CoolingFan::name() const
{
    return nullptr;
}

QString CoolingFan::title() const
{
    return title_;
}

bool CoolingFan::isEnabled() const
{
    return enabled_;
}

bool CoolingFan::isOn() const
{
    return state_;
}

void CoolingFan::setOn(bool on)
{
    printer_.moduleControl(&state_, on);
    emit isOnChanged();
}

void CoolingFan::notifyUpdateAll()
{
    emit isOnChanged();
}
