import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml 2.15
import "FGetPoint.js" as GetPoint

Window {
    id: root
    maximumWidth: 640
    minimumWidth: 640
    maximumHeight: 480
    minimumHeight: 480
    visible: true
    title: qsTr("Paint Figure")

    property var points: []

    Rectangle{
        id: rectCanvas
        width: 450
        height: 460
        anchors.left: parent.left
        anchors.margins: 5
        radius: 5
        color: "lightgrey"

            Canvas{
                id: rootCanvas
                anchors.fill: parent

                function draw(ctx){
                    ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
                    ctx.beginPath()

                    points = GetPoint.getPoint(cmFigureName.currentIndex, rectCanvas.width, rectCanvas.height, slider.value);

                    var i, j;
                    var x, y;

                    for(i = 0; i < points.length; i++){
                        for(j = 0; j < points[i].length; j++){
                            if(j % 2 == 0){
                                x = points[i][j];
                            }else{
                                y = points[i][j];
                            }
                        }
                      if(i === 0){
                          ctx.moveTo(x, y);
                      }else{
                          ctx.lineTo(x, y);
                      }
                    }//for

                    ctx.closePath();
                    ctx.lineWidth = 3;
                    ctx.stroke();
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.clearRect(0, 0, width, height);
                    ctx.translate(rootCanvas.width/2, rootCanvas.height/2);
                    draw(ctx);
                }//onPaint

            }//rootCanvas
    }

    Rectangle{
        width: parent.width - rectCanvas.width - 15
        height: rectCanvas.height / 2
        anchors.right: parent.right
        anchors.margins: 5
        radius: 5
        color: "lightgrey"

        Column{
            width: parent.width
            height: parent.height
            anchors.fill: parent

            Label{
                id: lblFigureName
                width: parent.width / 2
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                text: "Фигура"
            }

            ComboBox{
                id: cmFigureName
                width: parent.width - 10
                height: 40
                anchors.top: lblFigureName.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                model: ["Звезда", "Кольцо", "Дом", "Часы"]
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            Label{
                id: lblZoom
                width: parent.width / 2
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: cmFigureName.bottom
                anchors.topMargin: 15
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                text: "Приближение"
            }

            Slider{
                id: slider
                width: parent.width - 10
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: lblZoom.bottom
                from: 10
                to: 2
                value: 10
            }

            Button{
                id: cmdDraw
                width: parent.width - 10
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: slider.bottom
                anchors.topMargin: 15
                text: "Построить"
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14

                onClicked: {
                    rootCanvas.requestPaint();
                }
            }
        }//Column
    }//Rectangle

}//root
