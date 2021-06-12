QT  += core quickwidgets quick
QT -= gui
TEMPLATE = lib
DEFINES += SPLASHSCREEN_LIBRARY

CONFIG += c++11

include(../assets.pri)

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    splashscreen.cpp

HEADERS += \
    splashscreen_global.h \
    splashscreen.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

FORMS += \
    splashscreen.ui

RESOURCES += \
    qml.qrc

ICON = icon.ico
