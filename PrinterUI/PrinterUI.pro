QT += quick qml

TEMPLATE = lib
DEFINES += PRINTERUI_LIBRARY

CONFIG += c++17

include($$(applyCommonConfig))

include(../config.pri)

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    printerui.cpp

HEADERS += \
    PrinterUI_global.h \
    printerui.h


RESOURCES = res/printerui.qrc

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../UIBase -lUIBase
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../UIBase -lUIBase
else:unix: LIBS += -L$$OUT_PWD/../UIBase -lUIBase

INCLUDEPATH += $$PWD/../UIBase
DEPENDPATH += $$PWD/../UIBase

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../qzxing/src/release/ -lQZXing3
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../qzxing/src/debug/ -lQZXing3
else:unix: LIBS += -L$$OUT_PWD/../qzxing/src/ -lQZXing

INCLUDEPATH += $$PWD/../qzxing/src
DEPENDPATH += $$PWD/../qzxing/src

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Printer/release/ -lPrinter
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Printer/debug/ -lPrinter
else:unix: LIBS += -L$$OUT_PWD/../Printer/ -lPrinter

INCLUDEPATH += $$PWD/../Printer
DEPENDPATH += $$PWD/../Printer
