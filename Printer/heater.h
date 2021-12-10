#ifndef HEATER_H
#define HEATER_H

#include "Printer_global.h"

#include <QObject>

class PRINTER_EXPORT Heater : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray name READ name CONSTANT) // bed, icon: hearter_bed.svg
    Q_PROPERTY(float targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(float currentTemp READ currentTemp NOTIFY currentTempChanged)

public:
    explicit Heater(std::string const & name, std::string const & currentTemp,
                    std::string const & targetTemp, QObject *parent = nullptr);

signals:
    void targetTempChanged();

    void currentTempChanged();

public:
    QByteArray name() const;
    QString icon() const;
    float currentTemp() const;

    float targetTemp() const;
    void setTargetTemp(float value);

    void notifyUpdateAll();

private:
    std::string name_;
    std::string const & targetTemp_;
    std::string const & currentTemp_;
};

#endif // HEATER_H
