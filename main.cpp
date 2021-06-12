
#include "app.h"

#include <QApplication>
#include <QObject>
#include <QtWebEngine/QtWebEngine>
#include <splashscreen.h>
#include <utils.h>

int main(int argc, char *argv[]) {

  QtWebEngine::initialize();

  QApplication a(argc, argv);
  App app;

  Splashscreen splashScreen;
  splashScreen.Display();
  QObject::connect(&splashScreen, &Splashscreen::finished,
                   [&app]() { app.show(); });
  app.InitaliseContentArea();
  return a.exec();
}
