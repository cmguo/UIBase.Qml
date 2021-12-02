#ifndef FILAMENTFEEDER_H
#define FILAMENTFEEDER_H

#include "filament.h"

#include <QObject>
#include <QVariant>

class FilamentFeeder : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariantList filaments READ filaments CONSTANT)

    Q_PROPERTY(int currentFilament READ currentFilament WRITE setCurrentFilament NOTIFY currentFilamentChanged)

public:
    explicit FilamentFeeder(QObject *parent = nullptr);

signals:
    void currentFilamentChanged();

public:
    QVariantList filaments() const;

    int currentFilament() const;

    void setCurrentFilament(int index);
};

#endif // FILAMENTFEEDER_H
