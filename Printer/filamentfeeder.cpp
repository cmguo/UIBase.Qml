#include "filamentfeeder.h"

FilamentFeeder::FilamentFeeder(QObject *parent)
    : QObject(parent)
{
}

QList<Filament> FilamentFeeder::filaments() const
{
    return {};
}

int FilamentFeeder::currentFilament() const
{
    return 0;
}

void FilamentFeeder::setCurrentFilament(int index)
{
}
