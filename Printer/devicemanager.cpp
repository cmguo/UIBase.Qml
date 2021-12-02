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

Build DeviceManager::build() const
{
    return {};
}

Sdcard DeviceManager::sdcard() const
{
    return {};
}

Network DeviceManager::network() const
{
    return {};
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
    return {};
}

QByteArray Network::mask() const
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
