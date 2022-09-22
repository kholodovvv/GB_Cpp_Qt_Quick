import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.1

Window {
    maximumWidth: 500
    maximumHeight: 300
    minimumWidth: 500
    minimumHeight: 300
    visible: true
    title: qsTr("Area Triangle")

    Column{
        anchors.fill: parent
        anchors.margins: 5
        padding: 5
        spacing: 5

        TextField{
            id: sideA
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            placeholderText: "Значение стороны или координаты вершины А"
        }

        TextField{
            id: sideB
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            placeholderText: "Значение стороны или координаты вершины В"
        }

        TextField{
            id: sideC
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            placeholderText: "Значение стороны или координаты вершины С"
        }

        TextField{
            id: result
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            placeholderText: "Результат"
            enabled: false
        }

        Button{
            id: btnLenthCalculate
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            text: "Вычислить по длинам"
            onClicked: {
                if(sideA.text.length > 0 && sideB.text.length > 0 && sideC.text.length > 0){
                    result.text = calc_lenth(sideA.text, sideB.text, sideC.text)
                }else{
                    infMessage.setText("Введены не все данные для расчета!");
                    infMessage.open();
                }
            }
        }

        Button{
            id: btnCoordinatesCalculate
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 1.5
            height: 40
            text: "Вычислить по координатам"
            onClicked: {
                if(sideA.text.length > 0 && sideB.text.length > 0 && sideC.text.length > 0){
                    result.text = calc_сoordinates(sideA.text, sideB.text, sideC.text)
                }else{
                    infMessage.setText("Введены не все данные для расчета!");
                    infMessage.open();
                }
            }
        }
    }

    function calc_lenth(a, b, c)
    {
        //Вычисляем полупериметр
        var p = (Number(a) + Number(b) + Number(c)) / 2;

        return Math.sqrt(p * (p - a) * (p - b) * (p - c));
    }

    function calc_сoordinates(a, b, c)
    {
        var p1 = a.split(',');
        var p2 = b.split(',');
        var p3 = c.split(',');

        var A = Math.sqrt(((p1[0] - p2[0]) * (p1[0] - p2[0])) + ((p1[1] - p2[1]) * (p1[1] - p2[1])));
        var B = Math.sqrt(((p1[0] - p3[0]) * (p1[0] - p3[0])) + ((p1[1] - p3[1]) * (p1[1] - p3[1])));
        var C = Math.sqrt(((p2[0] - p3[0]) * (p2[0] - p3[0])) + ((p2[1] - p3[1]) * (p2[1] - p3[1])));

        return calc_lenth(A, B, C);

    }

    MessageDialog{
        id: infMessage
        title: "Information Message"
        standardButtons: infMessage.Ok;
        onAccepted: infMessage.close();
    }

}
