#include "filamentfeeder.h"

FilamentFeeder::FilamentFeeder(QObject *parent)
    : QObject(parent)
{
}

QVariantList FilamentFeeder::filaments() const
{
    return {QVariant::fromValue(Filament{}), QVariant::fromValue(Filament{}), QVariant::fromValue(Filament{}), QVariant::fromValue(Filament{})};
}

int FilamentFeeder::currentFilament() const
{
    return 0;
}

void FilamentFeeder::setCurrentFilament(int index)
{
}
