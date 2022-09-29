import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    maximumWidth: 640
    minimumWidth: 640
    maximumHeight: 480
    minimumHeight: 480
    visible: true
    title: qsTr("Список книг")

    ListModel{
        id: mbooks

        ListElement{
            name: "Портрет"
            autor: "Н.В.Гоголь"
            genre: "Классическая"
            img: "/:"
        }

        ListElement{
            name: "Сказка о царе Салтане"
            autor: "А.С.Пушкин"
            genre: "Сказки"
            img: "/:"
        }

        ListElement{
            name: "Робокоп"
            autor: "Стивен Грант"
            genre: "Фантастика"
            img: "/:"
        }
    }


    ListView{
        id: list
        anchors.fill: parent
        anchors.margins: 5
        model: mbooks
        spacing: 1

        header: Rectangle{
            width: parent.width
            height: 20
            color: "lightblue"

            Text{
                anchors.centerIn: parent
                text: "Библиотека им.Ленина"
                color: "black"
            }
        }

        footer: Rectangle{
            width: parent.width
            height: 20
            color: "lightblue"

            Text{
                anchors.centerIn: parent
                text: "Developer: Холодов В.В."
                color: "black"
            }
        }

        section.delegate: Rectangle{
            width: parent.width
            height: 20
            color: "lightgreen"

            Text{
                anchors.centerIn: parent
                text: section
                color: "black"
                font.bold: true
            }
        }

        section.property: "genre"

        delegate: Rectangle{
            width: list.width
            height: 45
            radius: 3
            color: "white"
            border.color: "lightgray"


            Column{
                anchors.fill: parent

                Row{
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text{ text: "Название"; font.weight: Font.Bold }
                    Text{ text: name }
                    spacing: 20
                }

                Row{
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text{ text: "Автор"; font.weight: Font.Bold }
                    Text{ text: autor }
                    spacing: 20
                }

                Row{
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text{ text: "Обложка"; font.weight: Font.Bold }
                    Text{ text: img }
                    spacing: 20
                }
            }//Column

        }//Rectagle

    }
}
