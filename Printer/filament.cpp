#include "filament.h"

Filament::Filament()
{
}

QByteArray Filament::name() const
{
    return "PLA";
}

QByteArray Filament::meterial() const
{
    return "PLA";
}

QColor Filament::color() const
{
    return Qt::red;
}

long Filament::weight() const
{
    return 0;
}

float Filament::remain() const
{
    return 0.5;
}
