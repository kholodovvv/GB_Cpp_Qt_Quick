import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    maximumWidth: 640
    minimumWidth: 640
    maximumHeight: 480
    minimumHeight: 480
    visible: true
    title: qsTr("Состояния Форм")

    Rectangle{
        id: programform
        anchors.fill: parent
        anchors.margins: 5
        state: "notLogged"

        states: [State {
            name: "notLogged"
            PropertyChanges {
                target: enterform
                visible: true
            }

            PropertyChanges {
                target: findForm
                visible: false
            }

            PropertyChanges {
                target: bIndic
                running: false
            }
        },

            State {
                name: "loggedIn"

                PropertyChanges {
                    target: bIndic
                    running: false
                }

                PropertyChanges {
                    target: findForm
                    visible: true
                }
            },

            State {
                name: "search"
                PropertyChanges {
                    target: bIndic
                    running: true
                }

                PropertyChanges {
                    target: tmr
                    running: true
                }

                PropertyChanges {
                    target: enterform
                    visible: false
                }
            }
        ]

        transitions: Transition {
            from: "notLogged"
            to: "loggedIn"

            PropertyAnimation{
                target: enterform
                to: 0
                property: "opacity"
                duration: 1000
            }

        }

        Column{
            id: enterform
            anchors.centerIn: parent
            width: parent.width / 2
            height: parent.height / 2
            spacing: 10
            padding: 15

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Авторизация пользователя";
                font.bold: true;
                font.pixelSize: 16
            }

            TextField{
                id: txLogin
                width: parent.width
                height: 30
                placeholderText: "Логин"
                maximumLength: 15
            }

            TextField{
                id: txPassword
                width: parent.width
                height: 30
                echoMode: TextField.Password
                placeholderText: "Пароль"
                maximumLength: 15
            }

            Button{
                id: btnSend
                width: parent.width
                height: 30
                text: "Войти"

                onClicked: {
                    if(txLogin.text === "root" && txPassword.text === "root"){
                        programform.state = "loggedIn"
                    }
                }
            }
        }//enterform

        Column{
            id: findForm
            anchors.centerIn: parent
            width: parent.width / 2
            height: parent.height / 2
            spacing: 10
            padding: 15

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Страница поиска";
                font.bold: true;
                font.pixelSize: 16
            }

            TextField{
                id: txFind
                width: parent.width
                height: 30
                placeholderText: "Поиск"
                maximumLength: 15
            }

            Button{
                id: btnFind
                width: parent.width
                height: 30
                text: "Искать"
                onClicked: {
                    programform.state = "search"
                }
            }

        }//findForm

        BusyIndicator{
            id: bIndic
            anchors.centerIn: parent
        }

        Timer{
            id: tmr
            interval: 2000
            onTriggered: {
                bIndic.running = false
            }
        }

    }//programform
}//root
