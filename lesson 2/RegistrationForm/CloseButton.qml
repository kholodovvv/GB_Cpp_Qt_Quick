import QtQuick 2.0

Rectangle{
    signal clicked()

    property int buttonWidth: 60
    property int buttonHeight: 40
    property int buttonRadius: 3
    property string buttonColor: "lightblue"
    property string buttonText: "Закрыть"
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
