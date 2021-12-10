#ifndef PRINTMANAGER_H
#define PRINTMANAGER_H

#include "Printer_global.h"
#include "coolingfan.h"
#include "filamentfeeder.h"
#include "heater.h"
#include "printtask.h"

#include <QObject>

class BBLPrinter;

class PRINTER_EXPORT PrintManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<Heater*> heaters READ heaters CONSTANT)
    Q_PROPERTY(QList<CoolingFan*> fans READ fans CONSTANT)
    Q_PROPERTY(bool isLightOn READ isLightOn WRITE setLightOn NOTIFY isLightOnChanged)

    Q_PROPERTY(FilamentFeeder* feeder READ feeder CONSTANT)
    Q_PROPERTY(PrintTask* currentTask READ currentTask NOTIFY currentTaskChanged)

public:
    static PrintManager & inst();

private:
    PrintManager(BBLPrinter & printer, QObject * parent = nullptr);

signals:
    void isLightOnChanged();

    void currentTaskChanged();

public slots:
    void print(Model const & model);

public:
    QList<Heater*> heaters() const;
    QList<CoolingFan*> fans() const;

    bool isLightOn() const;
    void setLightOn(bool on);

    FilamentFeeder* feeder() const;

    PrintTask* currentTask() const;

    void notifyUpdateAll();

private:
    BBLPrinter & printer_;
    QList<Heater*> heaters_;
    QList<CoolingFan*> fans_;
    FilamentFeeder* feeder_;
};

#endif // PRINTMANAGER_H
