/*
 *  Copyright 2021 The Scoopta software. All rights reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef APP_H
#define APP_H

#include <QMainWindow>

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

private:
  Ui::App *ui;
};
#endif // APP_H
