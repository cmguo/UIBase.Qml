#ifndef HEATER_H
#define HEATER_H

#include "Printer_global.h"

#include <QObject>

class PRINTER_EXPORT Heater : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray name READ name CONSTANT)
    Q_PROPERTY(float targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(float currentTemp READ currentTemp NOTIFY currentTempChanged)

public:
    explicit Heater(QObject *parent = nullptr);

signals:
    void targetTempChanged();

    void currentTempChanged();

public:
    QByteArray name() const;

    float targetTemp() const;

    void setTargetTemp(float value);

    float currentTemp() const;

};

#endif // HEATER_H
