import QtQuick 2.0
import UIBase 1.0

Item {

    property string number

    signal finished()

    Rectangle {
        anchors.fill: parent
        radius: 20
        color: Colors.lightbg2

        Repeater {
            model: 10
            delegate: ZButton {
                width: 90
                height: 90
                cornerRadius: 45
                x: 41 + 125 * (index % 3)
                y: 25 + 122 * Math.floor(index / 3)
                buttonType: ZButtonAppearance.Secondary
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
            buttonType: ZButtonAppearance.Secondary
            text: "确定"

            onClicked: {
                parent.parent.visible = false
                finished()
            }
        }
    }


}