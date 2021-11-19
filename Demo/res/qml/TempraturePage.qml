import QtQuick 2.0
import UIBase 1.0

Item {

    anchors.fill: parent

    Rectangle {
        id: temprature
        width: 606
        height: 519
        anchors.left: parent.left
        anchors.leftMargin: 37
        anchors.top: parent.top
        anchors.topMargin: 20
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: currentTitle
            height: 24
            anchors.left: parent.left
            anchors.leftMargin: 188
            anchors.top: parent.top
            anchors.topMargin: 45
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("当前温度")
        }

        ZText {
            id: targetTitle
            height: 24
            anchors.right: temprature.right
            anchors.top: currentTitle.top
            anchors.rightMargin: 139
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("目标温度")
        }

        Repeater {
            model: 3
            delegate: Item {
                height: 104
                anchors.top: currentTitle.bottom
                anchors.topMargin: 53 + 104 * index

                Image {
                    id: image
                    width: 40
                    height: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 90
                    anchors.verticalCenter: parent.verticalCenter
                }

                ZText {
                    id: current
                    height: 30
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: currentTitle.x + currentTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: "60"
                }

                ZButton {
                    id: target
                    width: 148
                    height: 68

                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: targetTitle.x + targetTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    buttonType: ZButtonAppearance.Secondary
                    text: "210"
                }

                ZText {
                    id: degree
                    anchors.left: target.right
                    anchors.leftMargin: 19
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: "°C"
                }
            }
        }

    }

    Rectangle {
        id: recorder
        height: 519
        anchors.left: temprature.right
        anchors.leftMargin: 23
        anchors.right: parent.right
        anchors.rightMargin: 82
        anchors.top: temprature.top
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: coldTitle
            height: 24
            anchors.left: parent.left
            anchors.leftMargin: 188
            anchors.top: parent.top
            anchors.topMargin: 45
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("当前温度")
        }

        ZText {
            id: targetTitle
            height: 24
            anchors.right: temprature.right
            anchors.top: currentTitle.top
            anchors.rightMargin: 139
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("目标温度")
        }

        Repeater {
            model: 3
            delegate: Item {
                height: 104
                anchors.top: currentTitle.bottom
                anchors.topMargin: 53 + 104 * index

                Image {
                    id: image
                    width: 40
                    height: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 90
                    anchors.verticalCenter: parent.verticalCenter
                }

                ZText {
                    id: current
                    height: 30
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: currentTitle.x + currentTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: "60"
                }

                ZButton {
                    id: target
                    width: 148
                    height: 68

                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: targetTitle.x + targetTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    buttonType: ZButtonAppearance.Secondary
                    text: "210"
                }

                ZText {
                    id: degree
                    anchors.left: target.right
                    anchors.leftMargin: 19
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: "°C"
                }
            }
        }

    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("TempraturePage.qml")
    }
}
