#ifndef UIBASE_H
#define UIBASE_H

#include "UIBase_global.h"

#include <QObject>

class QQmlEngine;

class UIBASE_EXPORT UIBase : public QObject
{
    Q_OBJECT
public:
    /**
     *
     * Initialize the qml global instance.
     *
     * @brief initGlobal
     */
    static void init(QQmlEngine & engine);
};

#endif // UIBASE_H
