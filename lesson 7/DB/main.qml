import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.LocalStorage 2.15
import QtQuick.Controls 2.15
import "DBFunctions.js" as DbFunctions

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Работа с базой данных")

    property string txtRec: ""
    property string colname: ""
    property int txtId: 0
    property var db: LocalStorage.openDatabaseSync("DBExample", "1.0", "Локальная БД", 1024);

    Rectangle{
        width: parent.width - 10
        height: parent.height - 10
        anchors.centerIn: parent
        color: "lightgray"
        radius: 5

        Row{
            id: selTables
            width: parent.width - 10
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10

            CustomComboBox{
                id: tables
                width: parent.width / 4
                height: 30
                anchors.right: parent.right
                anchors.rightMargin: 5
                model: tblmodel
                font.family: "Calibri"
                font.pointSize: 12
                font.bold: true

                onCurrentIndexChanged: {
                rotationAnim.restart();

                    if(tables.currentIndex > 0){
                        db.transaction((tx) => { DbFunctions.readContacts(tx, lstmodel, "newcontacts") })
                    }else{
                        db.transaction((tx) => { DbFunctions.readContacts(tx, lstmodel, "contacts") })
                    }
                }

                RotationAnimation on rotation{
                    id: rotationAnim
                    from: 0
                    to: 90
                    duration: 1000
                    target: tables.indicator
                }
            }
        }

        ListView{
            id: lstContacts
            width: parent.width - 10
            height: parent.height - 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: selTables.bottom
            anchors.topMargin: 20
            model: lstmodel

            header: Rectangle{
                width: parent.width
                height: 20
                color: "lightblue"

                Text{
                    anchors.centerIn: parent
                    text: "Контакты"
                    color: "black"
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold: true
                }
            }

            delegate: Rectangle{
                width: parent.width
                height: 40
                color: "lightgreen"

                Row{
                    width: parent.width
                    height: parent.height
                    spacing: 5

                    Rectangle{
                        width: (parent.width / 5) / 2
                        height: parent.height
                        border.color: "black"
                        radius: 5

                        Text{
                            id: txt1
                            anchors.centerIn: parent
                            text: item1
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }
                    }

                    Rectangle{
                        width: parent.width / 5
                        height: parent.height
                        border.color: "black"
                        radius: 5

                        Text{
                            id: txt2
                            anchors.centerIn: parent
                            text: item2
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }

                        MouseArea{
                            anchors.fill: parent
                            acceptedButtons: Qt.AllButtons
                            onDoubleClicked: {
                                if(tables.currentText === "contacts"){
                                    colname = "first_name"
                                    txtRec = txt2.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }else{
                                    colname = "name"
                                    txtRec = txt2.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }
                           }
                        }
                    }

                    Rectangle{
                        width: parent.width / 5
                        height: parent.height
                        border.color: "black"
                        radius: 5

                        Text{
                            id: txt3
                            anchors.centerIn: parent
                            text: item3
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }

                        MouseArea{
                            anchors.fill: parent
                            acceptedButtons: Qt.AllButtons
                            onDoubleClicked: {
                                if(tables.currentText === "contacts"){
                                    colname = "last_name"
                                    txtRec = txt3.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }else{
                                    colname = "surname"
                                    txtRec = txt3.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }
                           }
                        }
                    }

                    Rectangle{
                        width: parent.width / 4
                        height: parent.height
                        border.color: "black"
                        radius: 5

                        Text{
                            id: txt4
                            anchors.centerIn: parent
                            text: item4
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }

                        MouseArea{
                            anchors.fill: parent
                            acceptedButtons: Qt.AllButtons
                            onDoubleClicked: {
                                if(tables.currentText === "contacts"){
                                    colname = "email"
                                    txtRec = txt4.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }else{
                                    colname = "friends"
                                    txtRec = txt4.text;
                                    txtId = Number(txt1.text);
                                    editRecord.open();
                                }
                           }

                        }
                    }

                    Rectangle{
                        width: parent.width / 5
                        height: parent.height
                        border.color: "black"
                        radius: 5

                        Text{
                            id: txt5
                            anchors.centerIn: parent
                            text: item5
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }

                        MouseArea{
                            anchors.fill: parent
                            acceptedButtons: Qt.AllButtons
                            onDoubleClicked: {
                                colname = "phone"
                                txtRec = txt5.text;
                                txtId = Number(txt1.text);
                                editRecord.open();
                           }
                        }//MouseArea
                    }

                }//Row
            }
        }

        ListModel{
            id: lstmodel
        }

        ListModel{
            id: tblmodel
        }
    }

    Dialog{
        id: editRecord
        title: "Изменение записи"
        anchors.centerIn: parent
        standardButtons: Dialog.Ok | Dialog.Cancel

        Column{
            anchors.fill: parent

            TextField{
                id: textRec
                text: txtRec
            }
        }

        onAccepted: {
            if(textRec.text.length > 0){
                db.transaction((tx) => {DbFunctions.updateRecord(tx, colname, textRec.text, txtId, tables.currentText)});
                db.transaction((tx) => { DbFunctions.readContacts(tx, lstmodel, tables.currentText) });
            }else{
                editRecord.close();
            }
        }

    }


    Component.onCompleted: {

            if(db.transaction(DbFunctions.tableIsExists) === 0){
               try {
                   db.transaction((tx) => {DbFunctions.createSimpleTable(tx, "contacts")});
                   db.transaction((tx) => {
                   DbFunctions.addContact(tx, "Иванов", "Иван", "ivanoviv2182@mail.ru",
                   "+7(988)37333112", "contacts");
                   DbFunctions.addContact(tx, "Заварнов", "Владимир", "zavlad@mail.ru",
                   "+7(977)98373331", "contacts");
                   DbFunctions.addContact(tx, "Говорун", "Максим", "landlord2000@mail.ru",
                   "+7(977)3311111", "contacts");
                   });

                   db.transaction((tx) => {DbFunctions.createSimpleTable(tx, "newcontacts")});
                   db.transaction((tx) => {
                   DbFunctions.addContact(tx, "Иван", "Иванов", "Захар Прилепин, Игорь Зацепин",
                   "+7(999)354126", "newcontacts");
                   DbFunctions.addContact(tx, "Игорь", "Клоун", "Алексей Смурной, Иван Хромой",
                   "+7(495)785681", "newcontacts");
                   DbFunctions.addContact(tx, "Жак", "Доширак", "Иван Глаз, Павел Нос",
                   "+7(394)556789", "newcontacts");
                   });
                   db.transaction(DbFunctions.findTables);
               } catch (err) {
                   console.log("Error creating or updating table in database: " + err);
               }
           }else{
                try{
                    db.transaction((tx) => {DbFunctions.findTables(tx, tblmodel)});
                    db.transaction((tx) => { DbFunctions.readContacts(tx, lstmodel, "contacts") })
                }catch(error){
                    console.log("Error reading the table: " + error);
                }
           }

    tables.currentIndex = 0;
    }//Component
}
