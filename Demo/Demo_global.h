#ifndef DEMO_GLOBAL_H
#define DEMO_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(DEMO_LIBRARY)
#  define DEMO_EXPORT Q_DECL_EXPORT
#else
# define DEMO_EXPORT Q_DECL_IMPORT
#endif

#endif // DEMO_GLOBAL_H
