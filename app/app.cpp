
#include "app.h"
#include "ui_app.h"
#include <QQmlApplicationEngine>

App::App(QWidget *parent) : QMainWindow(parent), ui(new Ui::App) {
  ui->setupUi(this);
}

App::~App() { delete ui; }

void App::InitaliseContentArea() {
  ui->quickWidget->rootContext()->setContextProperty("app", this);
  ui->quickWidget->setAttribute(Qt::WA_TranslucentBackground);
  ui->quickWidget->setWindowFlags(Qt::FramelessWindowHint);

  ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/qml/main.qml")));
}

QQmlContext *App::qmlContext() {
  return ui->quickWidget->engine()->rootContext();
}
