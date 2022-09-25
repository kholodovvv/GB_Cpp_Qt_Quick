#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QLineEdit>
#include <QVBoxLayout>
#include <QGroupBox>
#include <QPropertyAnimation>
#include <QSequentialAnimationGroup>
#include <QParallelAnimationGroup>
#include <QGraphicsOpacityEffect>
#include <QGraphicsColorizeEffect>

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    void onCheckedForm();

private:
    const QString username = "admin";
    const QString userpassword = "passw";
    QSequentialAnimationGroup *grp_anim;
    QGroupBox *grp;
    QLineEdit *txLogin;
    QLineEdit *txPassword;
    QPushButton *btnSubmit;
    QParallelAnimationGroup *pgrp_anim;
    QGraphicsColorizeEffect *login_color_effect;
    QGraphicsColorizeEffect *password_color_effect;
    QPropertyAnimation *login_color_anim;
    QPropertyAnimation *password_color_anim;
    QPropertyAnimation *error_anim;
    QPropertyAnimation *error_anim2;
};
#endif // MAINWINDOW_H
