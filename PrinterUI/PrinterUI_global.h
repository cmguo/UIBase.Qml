#ifndef PRINTERUI_GLOBAL_H
#define PRINTERUI_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(PRINTERUI_LIBRARY)
#  define PRINTERUI_EXPORT Q_DECL_EXPORT
#else
#  define PRINTERUI_EXPORT Q_DECL_IMPORT
#endif

#endif // PRINTERUI_GLOBAL_H
