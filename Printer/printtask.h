#ifndef PRINTTASK_H
#define PRINTTASK_H

#include "Printer_global.h"
#include "model.h"

#include <QObject>

class PRINTER_EXPORT PrintTask : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Model model READ model CONSTANT)

    Q_PROPERTY(int currentPlate READ currentPlate NOTIFY currentPlateChanged)
    Q_PROPERTY(long remainTimeEstimate READ remainTimeEstimate NOTIFY remainTimeEstimateChanged)
    Q_PROPERTY(PrintStep printStep READ printStep NOTIFY printStepChanged)

public:

    enum PrintStep {
        Idle,
        Heating,
        Printing
    };

    enum NotifyState {
        Finish,
        Failed,
        Warning,
    };

    Q_ENUM(NotifyState)

public:
    explicit PrintTask(QObject *parent = nullptr);

signals:
    void currentPlateChanged();

    void remainTimeEstimateChanged();

    void printStepChanged();

    void notify(PrintTask::NotifyState state, QString messsage);

public:
    Model model() const;

    int currentPlate() const;
    long remainTimeEstimate() const;
    PrintStep printStep() const;

public slots:
    void printPlate(int index);

};

#endif // PRINTTASK_H
