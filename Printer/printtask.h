#ifndef PRINTTASK_H
#define PRINTTASK_H

#include "Printer_global.h"
#include "model.h"

#include <QObject>
#include <QVariant>

class BBLPrinter;

class PRINTER_EXPORT PrintTask : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariant model READ model CONSTANT)

    Q_PROPERTY(int currentPlate READ currentPlate NOTIFY currentPlateChanged)
    Q_PROPERTY(long totalTime READ totalTime NOTIFY totalTimeChanged)
    Q_PROPERTY(float progress READ progress NOTIFY progressChanged)
    Q_PROPERTY(PrintTask::PrintStep printStep READ printStep NOTIFY printStepChanged)

public:

    enum PrintStep {
        Idle,
        Heating,
        Printing
    };

    Q_ENUM(PrintStep)

    enum NotifyType {
        Finish,
        Failed,
        Warning,
    };

    Q_ENUM(NotifyType)

public:
    explicit PrintTask(QObject *parent = nullptr);

    explicit PrintTask(BBLPrinter & printer, QObject *parent = nullptr);

signals:
    void currentPlateChanged();

    void progressChanged();

    void totalTimeChanged();

    void printStepChanged();

    void notify(PrintTask::NotifyType state, QString messsage);

public:
    QVariant model() const;

    int currentPlate() const;
    long totalTime() const;
    float progress() const;
    PrintStep printStep() const;

    void notifyUpdateAll();

public slots:
    void printPlate(int index);

private:
    BBLPrinter & printer_;
};

#endif // PRINTTASK_H
