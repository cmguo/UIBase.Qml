#ifndef PRINTER_GLOBAL_H
#define PRINTER_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(PRINTER_LIBRARY)
#  define PRINTER_EXPORT Q_DECL_EXPORT
#else
#  define PRINTER_EXPORT Q_DECL_IMPORT
#endif

#endif // PRINTER_GLOBAL_H
