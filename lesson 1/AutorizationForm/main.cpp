#include "mainwindow.h"

#include <QApplication>
#include <QPushButton>
#include <QLineEdit>
#include <QVBoxLayout>
#include <QGroupBox>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    //QWidget wgt;

    w.setWindowFlags(Qt::Window | Qt::WindowTitleHint | Qt::WindowCloseButtonHint | Qt::WindowStaysOnTopHint);
    w.setWindowTitle("Форма авторизации");
    w.resize(640, 480);

    /*QGroupBox *grp = new QGroupBox(&wgt);
    grp->resize(300, 250);
    grp->setStyleSheet("QGroupBox {border: 2px solid lightgray; border-radius: 3px; background-color: white}");
    QVBoxLayout *pvbxLayout = new QVBoxLayout;
    grp->setLayout(pvbxLayout);
    grp->move(QPoint((wgt.width() - grp->width()) / 2, (wgt.height() - grp->height()) / 2));

     QLineEdit *txLogin = new QLineEdit("Логин");

     QLineEdit *txPassword = new QLineEdit("Пароль");
     txPassword->setEchoMode(QLineEdit::Password);

     QPushButton *btnSubmit = new QPushButton("Вход");
     connect(btnSubmit, &QPushButton::clicked, this, &MainWindow::onCheckedForm(txLogin->text(), txPassword->text()));

     pvbxLayout->addWidget(txLogin);
     pvbxLayout->addWidget(txPassword);
     pvbxLayout->addWidget(btnSubmit);*/

    w.show();
    return a.exec();
}
