QT += quick qml

CONFIG += c++14

include($$(applyCommonConfig))

include(../config.pri)

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp
HEADERS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Demo -lDemo
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Demo -lDemo
else:unix: LIBS += -L$$OUT_PWD/../Demo -lDemo

INCLUDEPATH += $$PWD/../Demo
DEPENDPATH += $$PWD/../Demo


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../UIBase -lUIBase
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../UIBase -lUIBase
else:unix: LIBS += -L$$OUT_PWD/../UIBase -lUIBase

INCLUDEPATH += $$PWD/../UIBase
DEPENDPATH += $$PWD/../UIBase

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../qzxing/src/release/ -lQZXing
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../qzxing/src/debug/ -lQZXing
else:unix: LIBS += -L$$OUT_PWD/../qzxing/src/ -lQZXing

INCLUDEPATH += $$PWD/../qzxing/src
DEPENDPATH += $$PWD/../qzxing/src
