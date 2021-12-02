#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H

#include "Printer_global.h"

#include <QObject>
#include <QVariantMap>

class PRINTER_EXPORT Account
{
    Q_GADGET

    Q_PROPERTY(QByteArray id READ id CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString icon READ id CONSTANT)
    Q_PROPERTY(QVariantMap datas READ datas CONSTANT)

public:
    QByteArray id() const;
    QString name() const;
    QString icon() const;
    QVariantMap datas() const;
};

class PRINTER_EXPORT AccountManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Account user READ user NOTIFY userChanged)
    Q_PROPERTY(QString loginUrl READ loginUrl CONSTANT)

public:
    static AccountManager & inst();

private:
    explicit AccountManager(QObject *parent = nullptr);

signals:
    void userChanged();

public:
    Account user() const;

    QString loginUrl() const;
};

#endif // ACCOUNTMANAGER_H
