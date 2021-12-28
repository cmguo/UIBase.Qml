#include "bbl_printer.h"
#include "devicemanager.h"

#include <QCoreApplication>
#include <QTranslator>

DeviceManager &DeviceManager::inst()
{
    static DeviceManager manager(BBLPrinter::inst());
    return manager;
}

DeviceManager::DeviceManager(BBLPrinter & printer, QObject *parent)
    : QObject(parent)
    , printer_(printer)
{
    auto en = new QTranslator(this);
    en->load("app_en");
    auto cn = new QTranslator(this);
    cn->load("app_cn");
    translators_.insert("en", en);
    translators_.insert("cn", cn);
    QCoreApplication::installTranslator(translators_.value(lang_));
    connect(&printer, &BBLPrinter::changed, this, &DeviceManager::notifyUpdateAll);
}

void DeviceManager::formatSdcard()
{
}

QVariant DeviceManager::build() const
{
    return QVariant::fromValue(Build{printer_.product, printer_.seriaNo, printer_.version});
}

QVariant DeviceManager::sdcard() const
{
    return QVariant::fromValue(Sdcard{});
}

QVariant DeviceManager::network() const
{
    return QVariant::fromValue(Network{printer_.netip, printer_.netmask});
}

QByteArray DeviceManager::language() const
{
    return lang_;
}

void DeviceManager::setLanguage(QByteArray const & value)
{
    QCoreApplication::removeTranslator(translators_.value(lang_));
    lang_ = value;
    QCoreApplication::installTranslator(translators_.value(lang_));
    emit languageChanged();
}

void DeviceManager::notifyUpdateAll()
{
    emit networkChanged();
    emit sdcardChanged();
    emit languageChanged();
}

Build::Build(const std::string &product, const std::string &seriaNO, const std::string &version)
    : product_(product)
    , seriaNO_(seriaNO)
    , version_(version)
{
}

QString Build::product() const
{
    return product_.c_str();
}

QByteArray Build::seriaNO() const
{
    return seriaNO_.c_str();
}

QByteArray Build::version() const
{
    return version_.c_str();
}

Network::Network(const std::string &ip, const std::string &mask)
    : ip_(ip)
    , mask_(mask)
{
}

QByteArray Network::ipv4() const
{
    return ip_.c_str();
}

QByteArray Network::mask() const
{
    return mask_.c_str();
}

QByteArray Network::gateway() const
{
    return {};
}

QByteArray Network::dns() const
{
    return {};
}

long Sdcard::capcity() const
{
    return 0;
}

long Sdcard::usage() const
{
    return 0;
}
