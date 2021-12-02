#ifndef MODELMANAGER_H
#define MODELMANAGER_H

#include "Printer_global.h"
#include "model.h"

#include <QObject>

class PRINTER_EXPORT ModelManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<Model> models READ models NOTIFY modelsChanged)

public:
    enum Source {
        All,
        Favorites,
        Borrowed,
        SDCard
    };

    Q_ENUM(Source)

public:
    static ModelManager& inst();

private:
    explicit ModelManager(QObject *parent = nullptr);

signals:
    void modelsChanged();

public slots:
    void fetchModels(ModelManager::Source source, int page);

public:
    QList<Model> models() const;
};

#endif // MODELMANAGER_H
