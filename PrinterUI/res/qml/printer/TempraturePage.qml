import QtQuick 2.12
import UIBase 1.0
import Printer 1.0
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
            model: PrintManager.heaters
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
                    source: "../../icon/heater_" + modelData.name + ".svg"
                }

                ZText {
                    height: 30
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: currentTitle.x + currentTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    font: Fonts.body_30
                    color: Colors.font2
                    text: modelData.currentTemp.toFixed(1)
                }

                ZTextInput {
                    id: targetButton
                    width: 148
                    height: 68
                    anchors.horizontalCenter: parent.left
                    anchors.horizontalCenterOffset: targetTitle.x + targetTitle.width / 2
                    anchors.verticalCenter: image.verticalCenter
                    cornerRadius: 42
                    textSize: 30
                    text: modelData.targetTemp.toFixed(1)

                    Binding on text {
                        value: numberPad.number
                        when: numberPad.target === modelData
                        // restoreMode: Binding.RestoreBinding
                    }

                    onFocusedChanged: {
                        if (focused)
                            numberPad.target = modelData
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
            model: PrintManager.fans

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
                    text: modelData.title
                }

                ZButton {
                    id: fanState
                    width: 148
                    height: 68
                    anchors.left: parent.right
                    anchors.leftMargin: 205
                    anchors.verticalCenter: parent.verticalCenter
                    enabled: modelData.enabled
                    type: modelData.enabled ?  ZButtonAppearance.Primitive : ZButtonAppearance.Secondary
                    cornerRadius: 42
                    textSize: 30
                    text: modelData.isOn ? "开" : "关"

                    onClicked: {
                        if (modelData.enabled)
                            modelData.isOn = !modelData.isOn;
                    }
                }

            }
        }

        NumberPad {
            id: numberPad
            anchors.fill: parent

            onFinished: {
                target.targetTemp = number
            }
        }

    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("TempraturePage.qml")
    }
}
