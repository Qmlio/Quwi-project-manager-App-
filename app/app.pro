QT       +=  core quickwidgets quick webengine

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11
TARGET=Quwi Project Manager
DEFINES += QT_DEPRECATED_WARNINGS

QTQUICK_COMPILER_SKIPPED_RESOURCES += html.qrc

include(../assets.pri)

SOURCES += \
    main.cpp \
    app.cpp

HEADERS += \
    app.h

FORMS += \
    app.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../splashscreen/release/ -lsplashscreen
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../splashscreen/debug/ -lsplashscreen

INCLUDEPATH += $$PWD/../splashscreen
DEPENDPATH += $$PWD/../splashscreen

RESOURCES += \
    qml.qrc


RC_ICONS = ../assets/icon.ico

