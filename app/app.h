#ifndef APP_H
#define APP_H

#include <QMainWindow>
#include <QQmlContext>

QT_BEGIN_NAMESPACE
namespace Ui {
class App;
}
QT_END_NAMESPACE

class App : public QMainWindow {
  Q_OBJECT

public:
  App(QWidget *parent = nullptr);
  ~App();
  void InitaliseContentArea();
  QQmlContext *qmlContext();

private:
  Ui::App *ui;
};
#endif // APP_H
