QT += gui

TEMPLATE = lib
DEFINES += PRINTER_LIBRARY

CONFIG += c++11

msvc {
    QMAKE_CXXFLAGS += /utf-8
}

TRANSLATIONS = Printer_en.ts \
               Printer_cn.ts

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    accountmanager.cpp \
    axiscontroller.cpp \
    bbl_printer.cpp \
    coolingfan.cpp \
    devicemanager.cpp \
    filament.cpp \
    filamentfeeder.cpp \
    heater.cpp \
    model.cpp \
    modelmanager.cpp \
    printer.cpp \
    printmanager.cpp \
    printtask.cpp \
    recordmanager.cpp

HEADERS += \
    Printer_global.h \
    accountmanager.h \
    axiscontroller.h \
    bbl_printer.h \
    converter.h \
    coolingfan.h \
    devicemanager.h \
    filament.h \
    filamentfeeder.h \
    heater.h \
    model.h \
    modelmanager.h \
    printer.h \
    printmanager.h \
    printtask.h \
    recordmanager.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
