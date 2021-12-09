import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var target: null
    property string number
    signal finished()

    visible: target != null

    Rectangle {
        anchors.fill: parent
        radius: 20
        color: Colors.lightbg2

        Item {
            width: 424
            height: 506
            anchors.centerIn: parent

            Repeater {
                model: 10
                delegate: ZButton {
                    width: 90
                    height: 90
                    cornerRadius: 45
                    x: 41 + 125 * (index % 3)
                    y: 25 + 122 * Math.floor(index / 3)
                    type: ZButtonAppearance.Tertiary
                    textSize: 30
                    text: index + 1

                    onClicked: {
                        number = number + ((index + 1) % 10)
                    }
                }
            }

            ZButton {
                width: 215
                height: 90
                x: 169
                y: 391
                cornerRadius: 45
                type: ZButtonAppearance.Floating
                textSize: 30
                text: "确定"

                onClicked: {
                    finished()
                    target = null
                }
            }
        }

    }

    onTargetChanged: {
        number = ""
    }

}
