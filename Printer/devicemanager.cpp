#include "devicemanager.h"

DeviceManager &DeviceManager::inst()
{
    static DeviceManager manager;
    return manager;
}

DeviceManager::DeviceManager(QObject *parent)
    : QObject(parent)
{
}

void DeviceManager::formatSdcard()
{
}

QVariant DeviceManager::build() const
{
    return QVariant::fromValue(Build{});
}

QVariant DeviceManager::sdcard() const
{
    return QVariant::fromValue(Sdcard{});
}

QVariant DeviceManager::network() const
{
    return QVariant::fromValue(Network{});
}

QString DeviceManager::language() const
{
    return {};
}

void DeviceManager::setLanguage(QString value)
{
}

QString Build::product() const
{
    return {};
}

QByteArray Build::seriaNO() const
{
    return {};
}

QByteArray Build::version() const
{
    return {};
}

QByteArray Network::ipv4() const
{
    return "192.168.0.1";
}

QByteArray Network::mask() const
{
    return "255.255.255.0";
}

long Sdcard::capcity() const
{
    return 0;
}

long Sdcard::usage() const
{
    return 0;
}
