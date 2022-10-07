#ifndef CHARTSPARAM_H
#define CHARTSPARAM_H

#include <QObject>
#include <QtMath>
#include <QVector>

class Chartsparam: public QObject
{
    Q_OBJECT
public:
    explicit Chartsparam(QObject *parent = nullptr);
    virtual ~Chartsparam(){};
    double funct1(double x); //sin(x)
    double funct2(double x); //y = x
    double funct3(double x); //y = |x - 2.5|
    double funct4(double x); //y = x^2
    double funct5(double x); //y = log2(x)

    Q_INVOKABLE
    void setParameters(double lX, double rX, double lY, double rY, double steps, int funct);
    Q_INVOKABLE
    void calculate();
    Q_INVOKABLE
    void calcSqMethod(); //Метод наименьших квадратов (МНК)

private:
    double step, leftX, rightX, leftY, rightY;
    int currFunct;
    QVector<double> valY;
    QVector<double> valX;
    QVector<double> sqX;
    QVector<int> tablY{13, 10, 9, 10, 12, 20, 26}; //табличные данные (задание 2)
    QVector<int> tablX{7, 31, 61, 99, 129, 178, 209};

signals:
    void calculated(QVector<double> valueX, QVector<double> valueY);
    void sqMethodcalculated(QVector<double> sX, QVector<int> tY);
    void getData(QVector<int> tX, QVector<int> tY);
};

#endif // CHARTSPARAM_H
