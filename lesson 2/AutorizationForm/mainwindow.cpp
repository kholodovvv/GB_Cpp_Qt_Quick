#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    grp = new QGroupBox(this);
    grp->resize(300, 250);
    grp->setStyleSheet("QGroupBox {border: 2px solid lightgray; border-radius: 3px; background-color: white}");
    QVBoxLayout *pvbxLayout = new QVBoxLayout;
    grp->setLayout(pvbxLayout);
    grp->move(QPoint((this->width() - grp->width()) / 2, (this->height() - grp->height()) / 2));

     txLogin = new QLineEdit;
     txLogin->setPlaceholderText("Логин");

     txPassword = new QLineEdit;
     txPassword->setPlaceholderText("Пароль");
     txPassword->setEchoMode(QLineEdit::Password);

     btnSubmit = new QPushButton("Вход");
     connect(btnSubmit, &QPushButton::clicked, this, &MainWindow::onCheckedForm);

     pvbxLayout->addWidget(txLogin);
     pvbxLayout->addWidget(txPassword);
     pvbxLayout->addWidget(btnSubmit);
}

MainWindow::~MainWindow()
{
    delete grp;
    delete txLogin;
    delete txPassword;
    delete grp_anim;
    delete pgrp_anim;
    delete btnSubmit;
    delete login_color_effect;
    delete password_color_effect;
    delete login_color_anim;
    delete password_color_anim;
    delete error_anim;
    delete error_anim2;
}

void MainWindow::onCheckedForm()
{
    grp_anim = new QSequentialAnimationGroup(this);

    if(txLogin->text() == username && txPassword->text() == userpassword){
        //Эффект плавного исчезновения
        QPropertyAnimation *success_anim = new QPropertyAnimation(grp);
        QGraphicsOpacityEffect *op_effect = new QGraphicsOpacityEffect(grp);
        grp->setGraphicsEffect(op_effect);
        success_anim->setTargetObject(op_effect);
        success_anim->setPropertyName("opacity");

        success_anim->setDuration(400);
        success_anim->setStartValue(1.0);
        success_anim->setEndValue(0.0);
        grp_anim->addAnimation(success_anim);

    }else{

        pgrp_anim = new QParallelAnimationGroup(this);
        login_color_effect = new QGraphicsColorizeEffect(txLogin);
        password_color_effect = new QGraphicsColorizeEffect(txPassword);

        txLogin->setGraphicsEffect(login_color_effect);
        txPassword->setGraphicsEffect(password_color_effect);

        login_color_anim = new QPropertyAnimation(login_color_effect, "color");
        password_color_anim = new QPropertyAnimation(password_color_effect, "color");

        login_color_anim->setDuration(1000);
        login_color_anim->setStartValue(QColor(Qt::red));
        login_color_anim->setEndValue(QColor(Qt::black));

        password_color_anim->setDuration(1000);
        password_color_anim->setStartValue(QColor(Qt::red));
        password_color_anim->setEndValue(QColor(Qt::black));

        pgrp_anim->addAnimation(login_color_anim);
        pgrp_anim->addAnimation(password_color_anim);
        grp_anim->addAnimation(pgrp_anim);

        //Эффект тряски
        error_anim = new QPropertyAnimation(grp, "geometry");
        error_anim2 = new QPropertyAnimation(grp, "geometry");

        error_anim->setDuration(200);
        QRect curPos;
        curPos = grp->geometry();
        error_anim->setStartValue(grp->geometry().translated(-5, 0));
        error_anim->setEndValue(curPos);
        grp_anim->addAnimation(error_anim);

        error_anim2->setDuration(200);
        error_anim2->setStartValue(grp->geometry().translated(+5, 0));
        error_anim2->setEndValue(curPos);
        grp_anim->addAnimation(error_anim2);
    }

    grp_anim->start();
}

