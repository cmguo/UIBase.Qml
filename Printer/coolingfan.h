#ifndef COOLINGFAN_H
#define COOLINGFAN_H

#include "Printer_global.h"

#include <QObject>

class BBLPrinter;

class PRINTER_EXPORT CoolingFan : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QByteArray name READ name CONSTANT)
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(bool enabled READ isEnabled CONSTANT)
    Q_PROPERTY(bool isOn READ isOn WRITE setOn NOTIFY isOnChanged)

public:
    explicit CoolingFan(BBLPrinter & printer, QString const & title, bool enabled, bool & state, QObject *parent = nullptr);

signals:
    void isOnChanged();

public:
    QByteArray name() const;

    QString title() const;

    bool isEnabled() const;

    bool isOn() const;

    void setOn(bool on);

    void notifyUpdateAll();

private:
    BBLPrinter & printer_;
    bool & state_;
    QString title_;
    bool enabled_ = false;
};

#endif // COOLINGFAN_H
