import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml 2.15

Window {
    id: root
    maximumWidth: 640
    minimumWidth: 640
    maximumHeight: 480
    minimumHeight: 480
    visible: true
    title: qsTr("Динамическая загрузка страниц")


    Component{
        id: uAutoriz

        Rectangle{
            id: userAutoriz
            width: 300
            height: 300
            anchors.centerIn: parent
            radius: 5
            color: "lightgrey"

            Column{
                anchors.fill: parent
                spacing: 5

                Label{
                    id: tcaption
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width / 2
                    height: 40
                    text: "Авторизация"
                    font.family: "Calibri"
                    font.pixelSize: 16
                    font.bold: true
                }

                TextField{
                    id: txLogin
                    width: parent.width - 10
                    height: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Логин"
                    maximumLength: 15
                }

                TextField{
                    id: txPassword
                    width: parent.width - 10
                    height: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    echoMode: TextField.Password
                    placeholderText: "Пароль"
                    maximumLength: 15
                }

                Button{
                    id: btnSend
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Войти"

                    onClicked: {
                        if(txLogin.text === "root" && txPassword.text === "123456"){
                            loader.sourceComponent = undefined;
                            loader.sourceComponent = wApp;
                        }

                    }
                }
            }//Column

        }//userAutoriz
    }

    Component{
        id: wApp

        Rectangle{
            id: windowApp
            width: parent.width - 10
            height: parent.height - 10
            anchors.centerIn: parent
            radius: 5
            color: "lightgrey"

            Column{
                anchors.fill: parent

                Label{
                    id: caption
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Главное окно приложения"
                    font.family: "Calibri"
                    font.pixelSize: 16
                    font.bold: true
                }

                Button{
                    id: btnNext
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Следующий лист"

                    onClicked: {
                        loader.sourceComponent = undefined;
                        loader.sourceComponent = nSheet;
                    }
                }
            }//Column
        }//windowApp
    }

    Component{
        id: nSheet

        Rectangle{
            id: nextSheet
            width: parent.width - 10
            height: parent.height - 10
            anchors.centerIn: parent
            radius: 5
            color: "lightgrey"

            Column{
                anchors.fill: parent

                Label{
                    id: captionText
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Следующее окно"
                    font.family: "Calibri"
                    font.pixelSize: 16
                    font.bold: true
                }

                Button{
                    id: btnPrevious
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Предыдущий лист"

                    onClicked: {
                        loader.sourceComponent = undefined;
                        loader.sourceComponent = wApp;
                    }
                }
            }//Column
        }//rect
    }

    Loader{
        id: loader
        anchors.centerIn: parent
        sourceComponent: uAutoriz
    }

}//root
