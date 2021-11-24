import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0
import ".."
import "qrc:/uibase/qml/widgets"

Item {

    id: mainPage

    Rectangle {
        id: printTask
        width: 576
        height: 499
        x: 30
        radius: 15
        color: Colors.lightbg2


        Image {
            id: image
            width: 375
            height: 319
            x: 38
            y: 30
            source: ""
        }

        Rectangle {
            id: light
            width: 116
            height: 188
            y: 30
            anchors.left: image.right
            anchors.leftMargin: 19
            radius: 15
            color: Colors.lightbg2
            border.color: "black"

            Image {
                width: 32
                height: 40
                y: 24
                anchors.horizontalCenter: parent.horizontalCenter
                source: ""
            }

            Rectangle {
                width: 73
                height: 1
                anchors.horizontalCenter: parent.horizontalCenter
                y: 94
                color: "#B9B9B9"
            }

            ZText {
                id: speedLabel
                height: 30
                y: 109
                anchors.horizontalCenter: parent.horizontalCenter
                font: Fonts.body_18
                text: qsTr("打印速度")
            }

            ZText {
                height: 30
                anchors.top: speedLabel.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                font: Fonts.body_28
                text: qsTr("100%")
            }
        } // light

        Image {
            width: 116
            height: 116
            anchors.left: light.left
            anchors.top: light.bottom
            anchors.topMargin: 16
        }

        ZProgressBar {
            id: progress
            height: 4
            anchors.left: parent.left
            anchors.leftMargin: 44
            anchors.right: parent.right
            anchors.rightMargin: 59
            anchors.top: title.bottom
            anchors.topMargin: 15
            value: 0.3
        }

        ZText {
            id: title
            anchors.left: progress.left
            anchors.top: image.bottom
            anchors.topMargin: 25
            font: Fonts.body_30
            color: Colors.font2
            text: "Robort_plane"
        }

        ZText {
            anchors.right: progress.right
            anchors.bottom: title.bottom
            font: Fonts.body_28
            color: Colors.font2
            text: "40%"
        }

        ZText {
            id: timeUsed
            height: 30
            x: progress.x
            anchors.top: progress.bottom
            font: Fonts.body_20
            color: "#929292"
            text: "02:54:46"
        }

        ZText {
            id: timeRemain
            height: 30
            anchors.right: progress.right
            anchors.top: timeUsed.top
            font: Fonts.body_20
            color: "#929292"
            text: "-0:54:46"
        }

    }

    Rectangle {
        id: temprature
        width: 576
        height: 129
        anchors.top: printTask.bottom
        anchors.topMargin: 18
        anchors.left: printTask.left
        radius: 15
        color: Colors.lightbg2

        ListView {
            id: list
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.bottomMargin: 25
            orientation: Qt.Horizontal
            model: printManager.tempratures
            delegate: Component {
                Item {
                    width: temprature.width / 3
                    height: list.height
                    Image {
                        width: 30
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: icon

                        Rectangle {
                            anchors.fill: parent
                        }
                    }
                    Item {
                        width: value.width + targetLabel.width
                        height: 32
                        y: 47
                        anchors.horizontalCenter: parent.horizontalCenter
                        ZText {
                            id: value
                            font: Fonts.body_32
                            text: current
                        }
                        ZText {
                            id: targetLabel
                            anchors.left: value.right
                            anchors.bottom: value.bottom
                            font: Fonts.body_24
                            text: "/" + target + "°C"

                            Binding on text {
                                value: "/" + numberPad.number + "°C"
                                when: numberPad.target === targetLabel
                            }
                        }
                    }

                    TapHandler {
                        gesturePolicy: TapHandler.ReleaseWithinBounds
                        onTapped: {
                            numberPad.target = targetLabel
                        }
                    }
                }
            } // Component

            Repeater {
                model: 2
                Rectangle {
                    x: list.width / 3 * (index + 1)
                    width: 1
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#B9B9B9"
                }
            }
        }

    }

    Rectangle {
        id: showboard
        anchors.top: parent.top
        anchors.left: printTask.right
        anchors.leftMargin: 16
        anchors.right: parent.right
        anchors.rightMargin: 28
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        radius: 15
        color: Colors.lightbg2

        Text {
            y: 530
            anchors.horizontalCenter: parent.horizontalCenter
            font: Fonts.body_28
            text: "Robort_plane"
        }

        Image {
            anchors.centerIn: parent
            source: ""
        }

        NumberPad {
            id: numberPad
            anchors.fill: parent

            onFinished: {
            }
        }
    }

    ZText {
        id: desc
        anchors.centerIn: parent
        font: Fonts.body_40
        color: "#40000000"
        text: qsTr("主页（MainPage2.qml）")
    }
}
