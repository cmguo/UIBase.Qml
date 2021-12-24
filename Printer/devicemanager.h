#ifndef DEVICEMANAGER_H
#define DEVICEMANAGER_H

#include "Printer_global.h"

#include <QObject>
#include <QVariant>

class BBLPrinter;

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
    Build(std::string const & product = {}, std::string const & seriaNO = {}, std::string const & version = {});

public:
    QString product() const;
    QByteArray seriaNO() const;
    QByteArray version() const;

private:
    std::string product_;
    std::string seriaNO_;
    std::string version_;
};

class PRINTER_EXPORT Network
{
    Q_GADGET

    Q_PROPERTY(QByteArray ipv4 READ ipv4 CONSTANT)
    Q_PROPERTY(QByteArray mask READ mask CONSTANT)
    Q_PROPERTY(QByteArray gateway READ gateway CONSTANT)
    Q_PROPERTY(QByteArray dns READ dns CONSTANT)

public:
    Network(std::string const & ip = {}, std::string const & mask = {});

public:
    QByteArray ipv4() const;
    QByteArray mask() const;
    QByteArray gateway() const;
    QByteArray dns() const;

private:
    std::string ip_;
    std::string mask_;
};

class PRINTER_EXPORT DeviceManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariant build READ build CONSTANT)
    Q_PROPERTY(QVariant sdcard READ sdcard NOTIFY sdcardChanged)
    Q_PROPERTY(QVariant network READ network  NOTIFY networkChanged)
    Q_PROPERTY(QString language READ language WRITE setLanguage NOTIFY languageChanged)

public:
    static DeviceManager & inst();

private:
    explicit DeviceManager(BBLPrinter & printer, QObject *parent = nullptr);

signals:
    void sdcardChanged();

    void networkChanged();

    void languageChanged();

public slots:
    void formatSdcard();

public:
    QVariant build() const;
    QVariant sdcard() const;
    QVariant network() const;

    QString language() const;
    void setLanguage(QString value);

private:
    void notifyUpdateAll();

private:
    BBLPrinter & printer_;
};

#endif // DEVICEMANAGER_H
