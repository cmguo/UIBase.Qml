#ifndef COOLINGFAN_H
#define COOLINGFAN_H

#include "Printer_global.h"

#include <QObject>

class PRINTER_EXPORT CoolingFan : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray name READ name CONSTANT)
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(bool isOn READ isOn WRITE setOn NOTIFY isOnChanged)

public:
    explicit CoolingFan(QObject *parent = nullptr);

signals:
    void isOnChanged();

public:
    QByteArray name() const;

    QString title() const;

    bool isOn() const;

    void setOn(bool on);
};

#endif // COOLINGFAN_H
