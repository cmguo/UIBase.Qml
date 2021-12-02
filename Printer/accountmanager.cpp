#include "accountmanager.h"

AccountManager &AccountManager::inst()
{
    static AccountManager manager;
    return manager;
}

AccountManager::AccountManager(QObject *parent)
    : QObject(parent)
{
}

Account AccountManager::user() const
{
    return {};
}

QString AccountManager::loginUrl() const
{
    return nullptr;
}

QByteArray Account::id() const
{
    return nullptr;
}

QString Account::name() const
{
    return nullptr;
}

QString Account::icon() const
{
    return nullptr;
}

QVariantMap Account::datas() const
{
    return {};
}
