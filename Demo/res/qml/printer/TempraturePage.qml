import QtQuick 2.12
import UIBase 1.0
import ".."
import "qrc:/uibase/qml/widgets"

Item {

    Rectangle {
        id: temprature
        width: 606
        height: 519
        x: 37
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: currentTitle
            height: 24
            anchors.left: parent.left
            anchors.leftMargin: 188
            y: 45
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
            model: printManager.tempratures
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
                    source: icon
                }

                ZText {
                    height: 30
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: currentTitle.x + currentTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: current
                }

                ZButton {
                    id: targetButton
                    width: 148
                    height: 68
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: targetTitle.x + targetTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    type: ZButtonAppearance.Secondary
                    cornerRadius: 42
                    textSize: 30
                    text: target

                    Binding on text {
                        value: numberPad.number
                        when: numberPad.target === targetButton
                        // restoreMode: Binding.RestoreBinding
                    }

                    onClicked: {
                        numberPad.target = this
                    }
                }

                ZText {
                    id: degree
                    anchors.left: targetButton.right
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
            x: 61
            y: 45
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
                    x: 43
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
                    type: ZButtonAppearance.Secondary
                    cornerRadius: 42
                    textSize: 30
                    text: state ? "开" : "关"
                }

            }
        }

        NumberPad {
            id: numberPad
            anchors.fill: parent
        }

    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("TempraturePage.qml")
    }
}
