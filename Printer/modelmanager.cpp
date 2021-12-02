#include "modelmanager.h"

ModelManager & ModelManager::inst()
{
    static ModelManager manager;
    return manager;
}

ModelManager::ModelManager(QObject *parent)
    : QObject(parent)
{
}

void ModelManager::fetchModels(Source source, int page)
{
}

QList<Model> ModelManager::models() const
{
    return {};
}
