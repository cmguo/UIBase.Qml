import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string number

    signal adjusted(bool isLeft)

    Rectangle {
        anchors.fill: parent
        radius: 42
        color: Colors.lightbg2

        ZButton {
            width: parent.height
            anchors.verticalCenter: parent.verticalCenter
            type: ZButtonAppearance.Secondary
            icon: "qrc:/uibase/icon/arrow_left.svg"

            onClicked: {
                adjusted(true)
            }
        }

        ZButton {
            width: parent.height
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            type: ZButtonAppearance.Secondary
            icon: "qrc:/uibase/icon/arrow_right.svg"

            onClicked: {
                adjusted(false)
            }
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: ""
        }
    }

}
