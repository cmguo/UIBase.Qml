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
                    cornerRadius: 42
                    textSize: 30
                    text: "210"

                    onClicked: {
                        numberPad.number = ""
                        numberPad.visible = true
                        text = numberPad.number
                        numberPad.button = this
                    }
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
            anchors.leftMargin: 61
            anchors.top: parent.top
            anchors.topMargin: 45
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("冷却风扇")
        }

        ZText {
            id: stateTitle
            height: 24
            anchors.right: parent.right
            anchors.top: coldTitle.top
            anchors.rightMargin: 117
            font: Fonts.body_20
            color: Colors.font2
            text: qsTr("运行状态")
        }


        Repeater {
            model: ListModel {
                ListElement {
                    title: "机箱风箱"
                    enable: true
                    state: true
                }
                ListElement {
                    title: "打印大风箱"
                    enable: true
                    state: false
                }
                ListElement {
                    title: "打印小风箱"
                    enable: false
                    state: true
                }
                ListElement {
                    title: "热端风箱"
                    enable: false
                    state: false
                }
            }

            delegate: Item {
                height: 96
                anchors.top: coldTitle.bottom
                anchors.topMargin: 38 + 96 * index

                ZText {
                    id: fanTitle
                    height: 30
                    anchors.left: parent.right
                    anchors.leftMargin: 43
                    anchors.verticalCenter: parent.verticalCenter
                    font: Fonts.body_28
                    color: Colors.font2
                    text: title
                }

                ZButton {
                    id: fanState
                    width: 148
                    height: 68
                    anchors.left: parent.right
                    anchors.leftMargin: 205
                    anchors.verticalCenter: parent.verticalCenter
                    buttonType: ZButtonAppearance.Secondary
                    cornerRadius: 42
                    textSize: 30
                    text: state ? "开" : "关"
                }

            }
        }

    }

    NumberPad {
        id: numberPad
        width: 424
        height: 506
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 82
        visible: false

        property var button

        onNumberChanged: {
            button.text = number
        }

        onFinished: {
            button = null
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("TempraturePage.qml")
    }
}
