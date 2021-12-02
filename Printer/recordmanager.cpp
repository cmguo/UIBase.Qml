#include "recordmanager.h"

RecordManager &RecordManager::inst()
{
    static RecordManager manager;
    return manager;
}

RecordManager::RecordManager(QObject *parent)
    : QObject(parent)
{
}

RecordSetting RecordManager::timelapse()
{
    return {};
}

void RecordManager::setTimelapse(RecordSetting setting)
{
}

RecordSetting RecordManager::recorder()
{
    return {};
}

void RecordManager::setRecorder(RecordSetting setting)
{
}

void RecordSetting::qt_check_for_QGADGET_macro()
{
    
}

QByteArray RecordSetting::format() const
{
    return {};
}

bool RecordSetting::cycle() const
{
    return false;
}

bool RecordSetting::automate() const
{
    return false;
}
