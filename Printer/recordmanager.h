#ifndef RECORDMANAGER_H
#define RECORDMANAGER_H

#include "Printer_global.h"

#include <QObject>

class PRINTER_EXPORT RecordSetting
{
    Q_GADGET

    Q_PROPERTY(QByteArray format READ format CONSTANT)
    Q_PROPERTY(bool cycle READ cycle CONSTANT)
    Q_PROPERTY(bool automate READ automate CONSTANT)

public:
    QByteArray format() const;
    bool cycle() const;
    bool automate() const;
};

class PRINTER_EXPORT RecordManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(RecordSetting timelapse READ timelapse WRITE setTimelapse NOTIFY timelapseChanged)
    Q_PROPERTY(RecordSetting recorder READ recorder WRITE setRecorder NOTIFY recorderChanged)

public:
    static RecordManager & inst();

private:
    explicit RecordManager(QObject *parent = nullptr);

signals:
    void timelapseChanged();
    void recorderChanged();

public:
    RecordSetting timelapse();
    void setTimelapse(RecordSetting setting);

    RecordSetting recorder();
    void setRecorder(RecordSetting setting);
};

#endif // RECORDMANAGER_H
