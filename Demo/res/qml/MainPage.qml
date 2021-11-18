import QtQuick 2.0
import QtQuick.Controls 2.2
import UIBase 1.0

Item {

    id: mainPage
    anchors.fill: parent

    Rectangle {
        id: filament
        width: 168
        height: 281
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 31
        radius: 15
        color: Colors.lightbg2

        ListView {
            anchors.fill: parent
            anchors.leftMargin: 26
            anchors.topMargin: 29
            spacing: 24
            model: ListModel {
                ListElement {
                    name: "BL_PLA"
                    color: "#FF7426"
                    remain: 0.6
                }
                ListElement {
                    name: "BL_PLA"
                    color: "#1ACF62"
                    remain: 0.35
                }
                ListElement {
                    name: "BL_PLA"
                    color: "#FFDD2C"
                    remain: 0.75
                }
                ListElement {
                    name: ""
                    color: ""
                    remain: 0.75
                }
            }
            delegate: Component {
                Item {
                    width: 98
                    height: 35
                    ZText {
                        height: 30
                        text: name
                    }
                    ZProgressBar {
                        y: 34
                        width: parent.width
                        height: 2
                        backgroundColor: "#CFCFCF"
                        progressColor: color
                        value: remain
                    }
                }
            }
        }

    }

    Rectangle {
        id: temprature
        width: 168
        height: 234
        anchors.top: filament.bottom
        anchors.left: filament.left
        anchors.topMargin: 10
        radius: 15
        color: Colors.lightbg2

        ListView {
            anchors.fill: parent
            anchors.leftMargin: 24
            anchors.topMargin: 20
            spacing: 12
            model: ListModel {
                ListElement {
                    name: "n1"
                    icon: "1"
                    target: 40
                    current: 27
                }
                ListElement {
                    name: "n2"
                    icon: "2"
                    target: 210
                    current: 67
                }
                ListElement {
                    name: "n3"
                    icon: "3"
                    target: 210
                    current: 67
                }
            }
            delegate: Component {
                Item {
                    width: 120
                    height: 58
                    Image {
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        source: icon
                    }
                    Rectangle {
                        id: line
                        height: 1
                        width: 47
                        x: 46
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#AEAEAE"
                    }
                    ZText {
                        width: line.width
                        height: 24
                        anchors.left: line.left
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        text: current
                    }
                    ZText {
                        width: line.width
                        height: 24
                        anchors.left: line.left
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
                        text: target
                    }
                    ZText {
                        height: 30
                        anchors.left: line.right
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: "°C"
                    }
                }
            } // Component
        }

    }

    Rectangle {
        id: light
        width: 168
        height: 99
        anchors.top: temprature.bottom
        anchors.left: filament.left
        anchors.topMargin: 10
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
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 37
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
    }

    ZText {
        id: desc
        anchors.centerIn: parent
        font: Fonts.body_40
        text: qsTr("主页（MainPage.qml）")
    }
}
