
#include "app.h"

#include <QApplication>
#include <QObject>
#include <QtWebEngine/QtWebEngine>
#include <splashscreen.h>

int main(int argc, char *argv[]) {

  QtWebEngine::initialize();

  QCoreApplication::setOrganizationName("Quwi");
  QCoreApplication::setApplicationName("Quwi Project Manager");
  QCoreApplication::setApplicationVersion("1.0.0");
  QApplication a(argc, argv);

  App app;
  Splashscreen splashScreen;

  qmlRegisterSingletonType(
      QUrl(QStringLiteral("qrc:/common/qml/Constants.qml")), "Quwi.Constants",
      1, 0, "Constants");

  app.qmlContext()->setContextProperty("splashScreen", &splashScreen);

  splashScreen.Display();
  QObject::connect(&splashScreen, &Splashscreen::finished,
                   [&app]() { app.show(); });

  app.InitaliseContentArea();

  return a.exec();
}
