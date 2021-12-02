#ifndef PRINTERUI_H
#define PRINTERUI_H

#include "PrinterUI_global.h"

class QQmlEngine;

class PRINTERUI_EXPORT PrinterUI
{
public:
    static void init(QQmlEngine & engine);
};

#endif // PRINTERUI_H
