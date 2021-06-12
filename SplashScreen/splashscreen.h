#ifndef SPLASHSCREEN_H
#define SPLASHSCREEN_H
#include <QQuickWidget>
#include <QWidget>
#include <splashscreen_global.h>

namespace Ui {
class Splashscreen;
}
#include <QObject>

class SPLASHSCREEN_EXPORT Splashscreen : public QWidget {
  Q_OBJECT

public:
  explicit Splashscreen(QWidget *parent = nullptr);
  ~Splashscreen();

  void Display(int delay = 5000);
  Q_INVOKABLE void setProgress(int progress);

signals:
  void finished();
  void progressChanged(int progress);

protected:
  void SetUpWindow();
  void MakeFrameless();
  void AddShadow();

  void SetUpContentArea();

private:
  Ui::Splashscreen *ui;
  QQuickWidget *qquickContentWidget;
};

#endif // SPLASHSCREEN_H
