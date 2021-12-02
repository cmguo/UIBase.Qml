#ifndef DEVICEMANAGER_H
#define DEVICEMANAGER_H

#include "Printer_global.h"

#include <QObject>

class PRINTER_EXPORT Sdcard
{
    Q_GADGET

    Q_PROPERTY(long capcity READ capcity CONSTANT)
    Q_PROPERTY(long usage READ usage CONSTANT)

public:
    long capcity() const;
    long usage() const;
};

class PRINTER_EXPORT Build
{
    Q_GADGET

    Q_PROPERTY(QString product READ product CONSTANT)
    Q_PROPERTY(QByteArray seriaNO READ seriaNO CONSTANT)
    Q_PROPERTY(QByteArray version READ version CONSTANT)

public:
    QString product() const;
    QByteArray seriaNO() const;
    QByteArray version() const;
};

class PRINTER_EXPORT Network
{
    Q_GADGET

    Q_PROPERTY(QByteArray ipv4 READ ipv4 CONSTANT)
    Q_PROPERTY(QByteArray mask READ mask CONSTANT)

public:
    QByteArray ipv4() const;
    QByteArray mask() const;
};

class PRINTER_EXPORT DeviceManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Build build READ build CONSTANT)
    Q_PROPERTY(Sdcard sdcard READ sdcard NOTIFY sdcardChanged)
    Q_PROPERTY(Network network READ network CONSTANT)
    Q_PROPERTY(QString language READ language WRITE setLanguage NOTIFY languageChanged)

public:
    static DeviceManager & inst();

private:
    explicit DeviceManager(QObject *parent = nullptr);

signals:
    void sdcardChanged();

    void languageChanged();

public slots:
    void formatSdcard();

public:
    Build build() const;
    Sdcard sdcard() const;
    Network network() const;

    QString language() const;
    void setLanguage(QString value);
};

#endif // DEVICEMANAGER_H
