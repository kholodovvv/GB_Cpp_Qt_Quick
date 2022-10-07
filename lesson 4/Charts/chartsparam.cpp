#include "chartsparam.h"

Chartsparam::Chartsparam(QObject *parent)
    : QObject(parent)
{

}

double Chartsparam::funct1(double x)
{
    return qSin(x);
}

double Chartsparam::funct2(double x)
{
    return x;
}

double Chartsparam::funct3(double x) //y = |x - 2.5|
{
    return abs(x - 2.5);
}

double Chartsparam::funct4(double x) //y = x^2
{
    return pow(x, 2);
}

double Chartsparam::funct5(double x)
{
    return log(2)*x;
}

void Chartsparam::setParameters(double lX, double rX, double lY, double rY, double steps, int funct)
{
    step = steps;
    leftX = lX;
    leftY = lY;
    rightX = rX;
    rightY = rY;
    currFunct = funct;
}

void Chartsparam::calculate()
{
    double i;

    for(i = leftX; i <= rightX; i += step){
        switch (currFunct) {
        case 0:
           valX.push_back(i);
           valY.push_back(funct1(i));
            break;

        case 1:
            valX.push_back(i);
            valY.push_back(funct2(i));
        break;

        case 2:
            valX.push_back(i);
            valY.push_back(funct3(i));
        break;

        case 3:
            valX.push_back(i);
            valY.push_back(funct4(i));
        break;

        case 4:
            valX.push_back(i);
            valY.push_back(funct5(i));
        break;

        default:
            break;
        }
    }
    emit calculated(valX, valY);
}

void Chartsparam::calcSqMethod()
{
    double sumX = 0.0, sumY = 0.0, summX = 0.0, sumXY = 0.0;
    double a = 0.0, b = 0.0;

    for(int i = 0; i < tablX.length(); i++){
        sumX += tablX[i]; //сумма абсцисс
        sumY += tablY[i]; //сумма ординат
        summX += tablX[i] * tablX[i]; //сумма квадратов абсцисс
        sumXY += tablX[i] * tablY[i]; //сумма произведений абсциссы на ординату
    }
    //a = (n*sumxy - (sumx*sumy)) / (n*sumx2 - sumx*sumx);
    //b = (sumy - *a*sumx) / n;
    a = (tablX.length() * sumXY - sumX * sumY) / (tablX.length() * summX - sumX * sumX);
    b = (sumY - (a * sumX)) / tablX.length();

    //строим точки для полученной аппроксимации y = ax+b
    for(int i = 0; i < tablX.length(); i++){
        sqX.push_back(a * tablX[i] + b);
    }

    emit getData(tablX, tablY);
    emit sqMethodcalculated(sqX, tablY);
}
