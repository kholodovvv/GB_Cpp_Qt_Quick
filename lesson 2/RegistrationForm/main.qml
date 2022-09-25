import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

Window {
    id: root
    maximumWidth: 640
    minimumWidth: 640
    maximumHeight: 500
    minimumHeight: 500
    visible: true
    title: qsTr("Регистрация нового пользователя")

    Rectangle{
        id: rect
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        color: "#F5F5F5"
        radius: 5

        Label {
            id: lblHandle
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "#708090"
            anchors.top: parent.top
            anchors.topMargin: 5
            text: qsTr("Регистрация")
            font.family: "Calibri"
            font.bold: true
            font.pixelSize: 28
        }

        RowLayout{
            id: row1
            width: parent.width
            height: parent.height - lblHandle.height
            anchors.top: lblHandle.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5

            Label{
                id: lblName
                width: 20
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Имя")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txName
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 200
                anchors.top: lblName.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 15
            }

            Label{
                id: lblSex
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 40
                anchors.left: lblName.left
                anchors.leftMargin: txName.width + 10
                anchors.top: parent.top
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Пол")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            ComboBox{
                id: cmbSex
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 70
                anchors.top: lblSex.bottom
                anchors.left: txName.right
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                model: ["М", "Ж"]
            }

            Label{
                id: lblAge
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 40
                anchors.left: lblSex.left
                anchors.leftMargin: cmbSex.width + 10
                anchors.top: parent.top
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Возраст")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txAge
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.top: lblAge.bottom
                anchors.left: cmbSex.right
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 2
                validator: RegExpValidator{regExp: /[0-9A-F]+/}
            }

            Label{
                id: lblEducation
                width: 60
                anchors.left: lblAge.left
                anchors.leftMargin: txAge.width + 10
                anchors.top: parent.top
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Образование")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            ComboBox{
                id: cmbEducation
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 200
                anchors.top: lblEducation.bottom
                anchors.left: txAge.right
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                model: ["Высшее", "Среднее специальное", "Общее среднее"]
            }

            Label{
                id: lblHobby
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: txName.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Хобби")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txHobby
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 290
                anchors.top: lblHobby.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 40
            }

            Label{
                id: lblCity
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.left: txHobby.left
                anchors.leftMargin: txHobby.width + 10
                anchors.top: txName.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Город")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txCity
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 250
                anchors.top: lblCity.bottom
                anchors.left: txHobby.right
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 40
            }

            Label{
                id: lblAboutMe
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: txCity.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("О себе")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            Rectangle{
                id: rectAboutMe
                Layout.preferredWidth: parent.width - 40
                Layout.preferredHeight: parent.height / 4
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: lblAboutMe.bottom
                anchors.topMargin: 5
                radius: 5

                ScrollView{
                    anchors.fill: parent

                    TextArea{
                        id: txAboutMe
                        font.family: "Calibri"
                        font.bold: true
                        font.pixelSize: 14
                    }
                }
            }

            Text{
                id: txSeparator
                Layout.preferredWidth: parent.width - 40
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: rectAboutMe.bottom
                anchors.topMargin: 15
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                color: "#708090"
                text: "------------------------------------------------------------------------" +
                      "------------------------------------------------------------------------"

            }

            Label{
                id: lblFindWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: txSeparator.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Ищу")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            ComboBox{
                id: cmbFindWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 130
                anchors.top: lblFindWhom.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                model: ["Мужчину", "Женщину", "Совесть :)"]
            }

            Label{
                id: lblAgeWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 100
                anchors.left: lblFindWhom.left
                anchors.leftMargin: cmbFindWhom.width + 10
                anchors.top: txSeparator.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("Возрастной период")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            Label{
                id: lblAgeFromWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 20
                anchors.left: cmbFindWhom.right
                anchors.leftMargin: 10
                anchors.top: lblAgeWhom.bottom
                anchors.topMargin: cmbFindWhom.height - 15
                color: "#778899"
                text: qsTr("От")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txAgeFromWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.top: lblAgeWhom.bottom
                anchors.left: lblAgeFromWhom.right
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 2
                validator: RegExpValidator{regExp: /[0-9A-F]+/}
            }

            Label{
                id: lblAgeToWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 20
                anchors.left: txAgeFromWhom.right
                anchors.leftMargin: 10
                anchors.top: lblAgeWhom.bottom
                anchors.topMargin: cmbFindWhom.height - 15
                color: "#778899"
                text: qsTr("До")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txAgeToWhom
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.top: lblAgeWhom.bottom
                anchors.left: lblAgeToWhom.right
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 2
                validator: RegExpValidator{regExp: /[0-9A-F]+/}
            }

            Label{
                id: lblFromCity
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 50
                anchors.left: lblAgeWhom.right
                anchors.leftMargin: txAgeToWhom.width + 10
                anchors.top: txSeparator.bottom
                anchors.topMargin: 5
                color: "#778899"
                text: qsTr("От куда (город)")
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
            }

            TextField{
                id: txFromCity
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 200
                anchors.top: lblFromCity.bottom
                anchors.left: txAgeToWhom.right
                anchors.leftMargin: 10
                font.family: "Calibri"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 30
            }

            RegButton{
                id: btnReg
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 120
                buttonHeight: 40
                anchors.top: txFromCity.bottom
                anchors.topMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 80
                onClicked: {
                    checkRegForm()
                }
            }

            CloseButton{
                id: btnClose
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 60
                anchors.top: txFromCity.bottom
                anchors.topMargin: 20
                anchors.left: btnReg.right
                anchors.leftMargin: 5
                onClicked: {
                    root.close()
                }
            }

        }//Layout

    }//Rectagle

    function checkRegForm(){
        if(txName.text.length > 0 && txAge.text.length > 0 && txHobby.text.length > 0 &&
           txCity.text.length > 0 && txAboutMe.text.length > 0 && txAgeFromWhom.text.length > 0 &&
           txAgeToWhom.text.length > 0 && txFromCity.text.length > 0){
            console.log("Имя: " + txName.text + "; Пол: " + cmbSex.currentText + "; Возраст: " +
                        txAge.text + "; Образование: " + cmbEducation.currentText + "; Хобби: " +
                        txHobby.text + "; Город: " + txCity.text + "; О себе: " + txAboutMe.text);
            console.log("Ищет: " + cmbFindWhom.currentText + ", в возрасте от " + txAgeFromWhom.text +
                        " до " + txAgeToWhom.text + ", из города " + txFromCity.text);
        }else{
            infMessage.text = "Все поля обязательно должны быть заполнены!"
            infMessage.open();
        }
    }

    MessageDialog{
        id: infMessage
        title: "Information Message"
        standardButtons: infMessage.Ok;
        onAccepted: infMessage.close();
    }

}//root
