import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import ru.chartsparam 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Графики")

    Chartsparam{
        id: charts

        onCalculated:{

            lnseries.clear();
            splseries.clear();

            for(var i = 0; i < valueX.length; i++){
                switch (typeChart.currentIndex){
                case 0:
                    lnseries.append(valueX[i], valueY[i])
                    break;

                case 1:
                    splseries.append(valueX[i], valueY[i])
                    break;
                }

            }

        }
/*          Task 2                          */
        onGetData: {
            for(var i = 0; i < tX.length; i++){
                scseries.append(tX[i], tY[i])
            }
        }

        onSqMethodcalculated: {
            for(var i = 0; i < tY.length; i++){
                splseries2.append(sX[i], tY[i])
            }
        }
/* ---------------------------------------  */
    }

    ChartView{
        id: chartView1
        width: parent.width / 2
        height: parent.height
        anchors.left: parent.left
        anchors.margins: 5
        antialiasing: true
        legend.visible: false
        title: "График функции " + cmbFunctions.currentText
        state: "Hidden"

        states: [State {
            name: "Hidden"
            PropertyChanges {
                target: chartView1
                visible: false
            }

        },

            State {
                name: "Visible"
                PropertyChanges {
                    target: chartView1
                    visible: true
                }
            }
        ]

        ValueAxis{
            id: axisX
            min: Number(txAxisXFrom.text)
            max: Number(txAxisXTo.text)
            tickCount: Number(txStep.text)
        }

        ValueAxis{
            id: axisY
            min: Number(txAxisYFrom.text)
            max: Number(txAxisYTo.text)
        }

        LineSeries{
            id: lnseries
            axisX: axisX
            axisY: axisY
        }

        SplineSeries{
            id: splseries
            axisX: axisX
            axisY: axisY
        }

    }

    ChartView{
        id: chartView2
        width: parent.width / 2
        height: parent.height
        anchors.left: parent.left
        anchors.margins: 5
        antialiasing: true
        legend.visible: false
        title: "График задание 2"
        state: "Hidden"

        states: [State {
            name: "Hidden"
            PropertyChanges {
                target: chartView2
                visible: false
            }
        },

            State {
                name: "Visible"
                PropertyChanges {
                    target: chartView2
                    visible: true
                }
            }
        ]

        ValueAxis{
            id: aX
            min: 7
            max: 209
            tickCount: 1
        }

        ValueAxis{
            id: aY
            min: 9
            max: 26
        }

        ScatterSeries{
            id: scseries
            axisX: aX
            axisY: aY
        }

        SplineSeries{
            id: splseries2
            axisX: aX
            axisY: aY
        }
    }

    Rectangle{
        id: rectControl
        width: parent.width / 2
        height: parent.height - 5
        anchors.right: parent.right
        anchors.margins: 5
        radius: 5
        color: "lightgray"

        Column{
            id: clTypeChart
            width: parent.width
            height: 60
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5

            Label{
                id: lblTypeChart
                width: parent.width - 10
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "Тип графика"
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
            }

            ComboBox{
                id: typeChart
                width: parent.width - 10
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                model: ["Line Chart", "Spline Chart"]
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
            }
        }//column

        Row{
            id: rCoord
            width: parent.width
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: clTypeChart.bottom
            anchors.topMargin: 5

            Label{
                id: lblAxisXFrom
                width: 15
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "X:"
            }

            TextField{
                id: txAxisXFrom
                width: 35
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: lblAxisXFrom.right
                anchors.leftMargin: 5
                maximumLength: 2
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "0"
            }

            Label{
                id: lblAxisXTo
                width: 10
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: txAxisXFrom.right
                anchors.leftMargin: 5
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "-"
            }

            TextField{
                id: txAxisXTo
                width: 35
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: lblAxisXTo.right
                maximumLength: 2
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "5"
            }

            Label{
                id: lblAxisYFrom
                width: 15
                height: 30
                anchors.left: txAxisXTo.right
                anchors.leftMargin: 15
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "Y:"
            }

            TextField{
                id: txAxisYFrom
                width: 35
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: lblAxisYFrom.right
                anchors.leftMargin: 5
                maximumLength: 2
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "0"
            }

            Label{
                id: lblAxisYTo
                width: 10
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: txAxisYFrom.right
                anchors.leftMargin: 5
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "-"
            }

            TextField{
                id: txAxisYTo
                width: 35
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: lblAxisYTo.right
                maximumLength: 2
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "5"
            }

        }//Row

        Row{
            id: rParam
            width: parent.width - 10
            height: 40
            anchors.top: rCoord.bottom
            anchors.topMargin: 15

            Label{
                id: lblStep
                width: 35
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "Шаг:"
            }

            TextField{
                id: txStep
                width: 40
                height: 30
                anchors.left: lblStep.right
                anchors.leftMargin: 5
                maximumLength: 3
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "0.1"
            }

            Label{
                id: lblFunct
                width: 75
                height: 20
                anchors.right: cmbFunctions.left
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
                text: "Функция:"
            }

            ComboBox{
                id: cmbFunctions
                width: 140
                height: 30
                anchors.right: parent.right
                model: ["y = sin(x)", "y = x", "y = |x - 2.5|", "y = x ^ 2", "y = log2(x)"]
                font.family: "Calibri"
                font.pixelSize: 16
                font.bold: true
            }
        }//Row

        Button{
            id: btnCalc
            width: 160
            height: 40
            anchors.top: rParam.bottom
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: "Построить график"
            font.family: "Calibri"
            font.pixelSize: 16
            font.bold: true

            onClicked: {
                chartView1.state = "Visible"
                chartView2.state = "Hidden"
                charts.setParameters(txAxisXFrom.text, txAxisXTo.text, txAxisYFrom.text,
                                     txAxisYTo.text, txStep.text, cmbFunctions.currentIndex);
                charts.calculate();
            }
        }

        Button{
            id: btnSqCalc
            width: 200
            height: 40
            anchors.top: btnCalc.bottom
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: "График по заданию 2"
            font.family: "Calibri"
            font.pixelSize: 16
            font.bold: true

            onClicked: {
                chartView2.state = "Visible"
                chartView1.state = "Hidden"
                charts.calcSqMethod()
            }
        }
    }

}//root
