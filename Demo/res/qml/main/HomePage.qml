import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0
import ".."
import "qrc:/uibase/qml/widgets"

Item {

    id: mainPage
    anchors.fill: parent

    Rectangle {
        id: filament
        width: 195
        height: 276
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 31
        radius: 15
        color: Colors.lightbg2

        ListView {
            anchors.fill: parent
            anchors.leftMargin: 13
            anchors.topMargin: 23
            spacing: 25
            model: printManager.amsList
            delegate: Component {
                Item {
                    width: 98
                    height: 35
                    Rectangle {
                        width: 29
                        height: 29
                        anchors.verticalCenter: parent.verticalCenter
                        radius: 14.5
                        color: "transparent"
                        border.width: 1
                        border.color: "#2C2C2E"

                        ZText {
                            anchors.centerIn: parent
                            focus: Fonts.body_24
                            text: index + 1
                        }
                    }

                    ZText {
                        x: 37
                        height: 30
                        text: name
                    }
                    ZProgressBar {
                        x: 37
                        y: 34
                        width: parent.width
                        height: 2
                        backgroundColor: "#CFCFCF"
                        progressColor: fcolor
                        value: remain
                    }
                }
            }
        }

    }

    Rectangle {
        id: temprature
        width: 195
        height: 239
        anchors.top: filament.bottom
        anchors.left: filament.left
        anchors.topMargin: 16
        radius: 15
        color: Colors.lightbg2

        ListView {
            anchors.fill: parent
            anchors.leftMargin: 24
            anchors.rightMargin: 30
            anchors.topMargin: 20
            spacing: 12
            model: printManager.tempratures
            delegate: Component {
                Item {
                    width: parent.width
                    height: 58
                    Image {
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        source: icon
                        Rectangle { anchors.fill: parent }
                    }
                    Item {
                        anchors.fill: parent
                        ZText {
                            id: currentLabel
                            anchors.right: targetLabel.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: current
                        }
                        ZText {
                            id: targetLabel
                            anchors.right: parent.right
                            anchors.bottom: currentLabel.bottom
                            font: Fonts.body_20
                            text: "/" + target + "°C"

                            Binding on text {
                                value: "/" + numberPad.number + "°C"
                                when: numberPad.target === targetLabel
                            }
                        }
                    }

                    TapHandler {
                        onTapped: {
                            numberPad.target = targetLabel
                        }
                    }
                }
            } // Component
        }

    }

    Rectangle {
        id: light
        width: 195
        height: 97
        anchors.top: temprature.bottom
        anchors.left: filament.left
        anchors.topMargin: 16
        radius: 15
        color: Colors.lightbg2

        Image {
            x: 29
            y: 24
            width: 32
            height: 40
            source: ""
        }

        ZText {
            x: 80
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("照明灯")
            font: Fonts.body_18
        }
    }

    Rectangle {
        id: showboard
        anchors.top: parent.top
        anchors.left: filament.right
        anchors.leftMargin: 18
        anchors.right: parent.right
        anchors.rightMargin: 32
        anchors.bottom: light.bottom
        radius: 15
        color: Colors.lightbg2

        Text {
            x: 62
            y: 39
            font: Fonts.body_28
            text: "Robort_plane.3mf"
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
        text: qsTr("主页（MainPage.qml）")
    }
}
