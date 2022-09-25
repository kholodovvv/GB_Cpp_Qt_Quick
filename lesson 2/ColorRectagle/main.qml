import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Цветной квадрат")

    Rectangle{
        id: colorRect
        width: 200
        height: 200
        anchors.centerIn: parent
        color: "red"

        states: State{
            name: "rotated"
            PropertyChanges {
                target: colorRect
                rotation: 180
            }
        }

        transitions: Transition {
            RotationAnimation { duration: 2000; direction: RotationAnimation.Counterclockwise }
        }

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            onClicked: {
                if(mouse.button === Qt.LeftButton){
                    parent.color = getRandomColor();
                }else if(mouse.button === Qt.RightButton){
                    colorRect.state = "rotated"
                }
            }

            onDoubleClicked: {
                if(mouse.button === Qt.LeftButton) {
                    radAnim.start()
                }
            }
        }//MouseArea
    }//colorRect

    function getRandomColor() {
      var letters = '0123456789ABCDEF';
      var color = '#';
      for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
      }
      return color;
    }

    PropertyAnimation{
        id: radAnim
        target: colorRect
        property: "radius"
        to: 150
        duration: 1000
    }

}//root
