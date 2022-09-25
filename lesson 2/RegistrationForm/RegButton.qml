import QtQuick 2.0

Rectangle{
    signal clicked()

    property int buttonWidth: 100
    property int buttonHeight: 30
    property int buttonRadius: 3
    property string buttonColor: "lightgreen"
    property string buttonText: "Зарегистрировать"
    property string buttonColorText: "black"

    width: buttonWidth
    height: buttonHeight
    color: buttonColor
    radius: buttonRadius

    MouseArea{
        anchors.fill: parent
        onClicked: parent.clicked()
    }

    Text {
        text: buttonText
        color: buttonColorText
        anchors.centerIn: parent
        font.family: "Calibri"
        font.bold: true
        font.pixelSize: 14
    }
}
