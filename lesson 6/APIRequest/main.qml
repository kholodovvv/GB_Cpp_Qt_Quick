import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQml 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Работа с API")

    property string current_cash: "" // <- Task 2
    property var arr_courses: []     // <- --//--

    TabView{
        id: tView
        anchors.fill: parent

        Tab{
            title: "Task 1"

            Rectangle{
                anchors.fill: parent
                radius: 5
                color: "lightgrey"

                Label{
                    id: lblCaption
                    width: parent.width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    text: "Расширенный поиск библии"
                    font.family: "Arial"
                    font.pointSize: 16
                    font.bold: true
                }

                Row{
                    id: rSearchProperty
                    width: parent.width
                    height: 60
                    anchors.top: lblCaption.bottom
                    anchors.topMargin: 10
                    padding: 5

                    ComboBox{
                        id: cmbSelectFind
                        width: 150
                        height: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        model: ["Поиск по названию", "Поиск по ID"]
                        onCurrentIndexChanged: {
                            switch (cmbSelectFind.currentIndex){
                                case 0:
                                    txTextFind.text = "Berean Study Bible"
                                break;

                                case 1:
                                    txTextFind.text = "bba9f40183526463-01"
                                break;
                            }
                        }
                    }

                    TextField{
                        id: txTextFind
                        width: 200
                        height: 30
                        anchors.left: cmbSelectFind.right
                        anchors.leftMargin: 5
                        maximumLength: 25
                    }

                    Button{
                        id: btnFind
                        width: 50
                        height: 30
                        anchors.left: txTextFind.right
                        anchors.leftMargin: 5
                        text: "Искать"

                        onClicked: {
                            if(txTextFind.text.length > 0){
                                var tx = "", req;
                                if(cmbSelectFind.currentIndex === 0){
                                    var txt = txTextFind.text.split(" ");

                                    if(txt.length > 1){
                                        for(var i = 0; i < txt.length - 1; i++){
                                            tx += txt[i] + "%20";
                                        }
                                    }

                                    tx += txt[txt.length - 1];
                                    req = "https://api.scripture.api.bible/v1/bibles?language=eng&name=" + tx;

                                }else if(cmbSelectFind.currentIndex === 1){
                                    req = "https://api.scripture.api.bible/v1/bibles/" + txTextFind.text.trim();
                                    console.log(req);
                                }

                                getData(req, searchModal, cmbSelectFind.currentIndex);
                            }
                        }
                    }
                }//Row

                ListModel{
                    id: searchModal
                }

                ListView{
                    id: resSearch
                    width: parent.width - 10
                    height: parent.height / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rSearchProperty.bottom
                    anchors.topMargin: 5
                    model: searchModal

                    header: Rectangle{
                        width: parent.width
                        height: 20
                        color: "lightblue"

                        Text{
                            anchors.centerIn: parent
                            text: "Результаты поиска"
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: 12
                            font.bold: true
                        }
                    }

                    delegate: Rectangle{
                        width: parent.width
                        height: 20
                        color: "lightgreen"

                        Text{
                            anchors.centerIn: parent
                            text: section
                            color: "black"
                            font.family: "Calibri"
                            font.pointSize: 10
                            font.bold: true
                        }
                    }
                }

            }//Rectagle

        }//Tab

        Tab{
            title: "Task 2"

            Rectangle{
                anchors.fill: parent
                radius: 5
                color: "lightgreen"

                Label{
                    id: lblСourse
                    width: parent.width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    text: "Конвертор курсов валют"
                    font.family: "Arial"
                    font.pointSize: 16
                    font.bold: true
                }

                Button{
                    id: btnСourse
                    width: 100
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.top: lblСourse.bottom
                    anchors.topMargin: 10
                    text: "Получить курсы"

                    onClicked: {
                        getСourse("https://cdn.cur.su/api/cbr.json");
                        txBaseCash.text = current_cash;
                    }
                }

                Row{
                    width: parent.width - 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: btnСourse.bottom
                    anchors.topMargin: 10

                    TextField{
                        id: txBaseCash
                        width: 60
                        height: 30
                        anchors.left: parent.left
                        font.family: "Arial"
                        font.pointSize: 12
                        font.bold: true
                        enabled: false
                    }

                    TextField{
                        id: txCash
                        width: 60
                        height: 30
                        anchors.left: txBaseCash.right
                        anchors.leftMargin: 5
                        placeholderText: "Сумма"
                        font.family: "Arial"
                        font.pointSize: 8
                        font.bold: true
                        validator: RegExpValidator{regExp: /[0-9A-F]+/}
                    }

                    Label{
                        id: lblRole
                        width: 30
                        height: 30
                        anchors.left: txCash.right
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: height / 4
                        font.family: "Arial"
                        font.pointSize: 12
                        font.bold: true
                        text: ">>>"
                    }

                    ComboBox{
                        id: cmbCoursesCash
                        width: 50
                        height: 30
                        anchors.left: lblRole.right
                        anchors.leftMargin: 5
                        model: ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN",
                                "BRL", "HUF", "HKD", "DKK", "USD", "EUR",
                                "INR", "KZT", "CAD", "KGS", "CNY", "MDL",
                                "NOK", "PLN", "RON", "XDR", "SGD", "TJS",
                                "TRY", "TMT", "UZS", "UAH", "CZK", "SEK",
                                "CHF", "ZAR", "KRW", "JPY", "RUB"]
                    }

                    Button{
                        id: btnCalc
                        width: 80
                        height: 30
                        anchors.left: cmbCoursesCash.right
                        anchors.leftMargin: 5
                        text: "Расcчитать"

                        onClicked: {
                               txSum.text = Math.round(((Number(txCash.text) * Number(arr_courses[cmbCoursesCash.currentIndex])) * 100) / 100);
                        }
                    }

                    Label{
                        id: lblSum
                        width: 20
                        height: 30
                        anchors.left: btnCalc.right
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: height / 4
                        font.family: "Arial"
                        font.pointSize: 12
                        font.bold: true
                        text: " = "
                    }

                    TextField{
                        id: txSum
                        width: 80
                        height: 30
                        anchors.left: lblSum.right
                        //anchors.leftMargin: 5
                        placeholderText: "Результат"
                        font.family: "Arial"
                        font.pointSize: 8
                        font.bold: true
                    }


                }

            }//Rectagle
        }

        Tab{
            title: "Task 3"

            Rectangle{
                anchors.fill: parent
                radius: 5
                color: "lightblue"

                Label{
                    id: lblWeather
                    width: parent.width / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    text: "Прогноз погоды"
                    font.family: "Arial"
                    font.pointSize: 16
                    font.bold: true
                }

                Row{
                    id: getWeather
                    width: parent.width - 10
                    height: 30
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.top: lblWeather.bottom
                    anchors.topMargin: 10
                    spacing: 5

                    TextField{
                        id: txNameCity
                        width: 140
                        height: 30
                        placeholderText: "Город"
                    }

                    Button{
                        id: btnSearch
                        width: 150
                        height: 30
                        text: "Получить прогноз"

                        onClicked: {
                            if(txNameCity.text.length > 0){
                                var query = "https://api.gismeteo.net/v2/search/cities/?query=" + txNameCity.text;
                                getGeoObject(query);
                            }
                        }
                    }

                }

                Label{
                    id:lblInfo
                    width: parent.width - 10
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: getWeather.bottom
                    anchors.topMargin: 10
                    text: "GisMeteo монетизировался! API ключ просто так получить невозможно.
Когда даёте задания для практической работы, хотя бы проверяйте
их актуальность. Каким образом я должен ответ от сервера парсить?"
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold: true
                }

            }//Rectagle
        }
    }//TableView


    function getData(request, lmodel, type_req) {
        var xmlhttp = new XMLHttpRequest();
        const data = null;
        xmlhttp.withCredentials = true;
        lmodel.clear();

        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == xmlhttp.DONE && xmlhttp.status == 200){
                lmodel.append({section:parseResponse(xmlhttp.responseText, type_req)});
            }
        }

        xmlhttp.open("GET", request);
        xmlhttp.setRequestHeader("api-key", "713484ccab11d50be3d91785d47dce32");

        xmlhttp.send(data);
    }

    function getСourse(request) {
        var xmlhttp = new XMLHttpRequest();
        const data = null;
        xmlhttp.withCredentials = true;

        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == xmlhttp.DONE && xmlhttp.status == 200){
                parseСourse(xmlhttp.responseText);
            }
        }

        xmlhttp.open("GET", request);
        xmlhttp.send(data);
    }

    function parseResponse(response, type_req){

        var jsonObj = JSON.parse(response);

        if(type_req === 0){
            return jsonObj.data[0].id + " " + jsonObj.data[0].name;
        }else{
            return jsonObj.data.id + " " + jsonObj.data.name;
        }

    }

    function parseСourse(response){

        var jsonObj = JSON.parse(response);
        current_cash = jsonObj.base;

        for(var i in jsonObj.rates){
            arr_courses.push(jsonObj.rates[i]);
        }

    }

    function getGeoObject(request) {
        var xmlhttp = new XMLHttpRequest();
        const data = null;
        xmlhttp.withCredentials = true;

        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == xmlhttp.DONE && xmlhttp.status == 200){
                console.log(xmlhttp.responseText);
                //parseResponse(xmlhttp.responseText);
            }else{
                console.log(xmlhttp.statusText);
            }
        }

        xmlhttp.open("GET", request);
        xmlhttp.setRequestHeader("X-Gismeteo-Token", "56b30cb255.3443075");

        xmlhttp.send(data);
    }

}
