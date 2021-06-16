#include "splashscreen.h"
#include "ui_splashscreen.h"
#include <QGraphicsDropShadowEffect>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#define MARGIN 8

Splashscreen::Splashscreen(QWidget *parent)
    : QWidget(parent), ui(new Ui::Splashscreen) {
  ui->setupUi(this);

  SetUpWindow();
  connect(this, &Splashscreen::finished, this, &Splashscreen::close);
}

Splashscreen::~Splashscreen() { delete ui; }

void Splashscreen::Display(int delay) { show(); }

void Splashscreen::setProgress(int progress) {

  if (progress >= 99) {
    QTimer::singleShot(2000, [this]() { emit finished(); });
  }

  emit progressChanged(progress);
}

void Splashscreen::SetUpWindow() {

#if defined(Q_OS_WIN)
  setWindowFlags(windowFlags() | Qt::WindowMinimizeButtonHint);
#endif
  setAttribute(Qt::WA_NoSystemBackground, true);
  setAttribute(Qt::WA_TranslucentBackground);
  setWindowFlags(Qt::FramelessWindowHint);

  AddShadow();
  SetUpContentArea();

  qmlRegisterSingletonType(
      QUrl(QStringLiteral("qrc:/common/qml/Constants.qml")), "Quwi.Constants",
      1, 0, "Constants");

  qquickContentWidget->setSource(QUrl(QStringLiteral("qrc:/qml/Index.qml")));
}

void Splashscreen::AddShadow() {
  QGraphicsDropShadowEffect *windowShadow = new QGraphicsDropShadowEffect(this);
  windowShadow->setBlurRadius(9.0);
  windowShadow->setColor(QColor(0, 79, 0, 160));
  windowShadow->setOffset(0);

  ui->shadow_widget->setGraphicsEffect(windowShadow);
}

void Splashscreen::SetUpContentArea() {

  // background widget that will contain the content area widget
  auto background = new QWidget(this);
  QRect geom(((width() / 2) - ((width() - MARGIN * 2) / 2)),
             ((height() / 2) - ((height() - MARGIN * 2) / 2)),
             width() - MARGIN * 2, height() - MARGIN * 2);

  background->setGeometry(geom);

  background->setStyleSheet("background:white");
  background->setAttribute(Qt::WA_AlwaysStackOnTop);

  QVBoxLayout *background_layout = new QVBoxLayout(background);
  background_layout->setContentsMargins(0, 0, 0, 0);
  background_layout->setSpacing(0);

  // The content widget
  qquickContentWidget = new QQuickWidget(background);

  qquickContentWidget->engine()->rootContext()->setContextProperty(
      "splashScreenManager", this);

  qquickContentWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);

  background_layout->addWidget(qquickContentWidget);
}
