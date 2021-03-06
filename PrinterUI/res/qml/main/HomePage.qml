import QtQuick 2.12
import QtQuick.Controls 2.12
// import QtGraphicalEffects 1.12
import UIBase 1.0
import Printer 1.0
import ".."
import "../printer"
import "qrc:/uibase/qml/widgets"

Item {

    id: mainPage
/*
    DropShadow {
        anchors.fill: filament
        horizontalOffset: 0
        verticalOffset: 0
        radius: 15
        samples: 31
        cached: true
        color: "#40000000"
        source: filament
    }
*/
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
            model: PrintManager.feeder.filaments
            delegate: Component {
                Item {
                    id: filamentItem
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
                        text: modelData.name
                    }
                    ZProgressBar {
                        x: 37
                        y: 34
                        width: parent.width
                        size: ZProgressBarAppearance.Small
                        progressColor: modelData.color
                        value: modelData.remain
                    }

                    TapHandler {
                        gesturePolicy: TapHandler.ReleaseWithinBounds
                        onTapped: {
                            filamentPad.target = filamentItem
                        }
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
            model: PrintManager.heaters
            delegate: Component {
                Item {
                    id: tempratureItem
                    width: parent.width
                    height: 58
                    Image {
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../icon/heater_" + modelData.name + ".svg"
                    }
                    Item {
                        anchors.fill: parent
                        ZText {
                            id: currentLabel
                            anchors.right: degreeLabel.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData.currentTemp.toFixed(1)
                        }
                        ZText {
                            id: degreeLabel
                            anchors.right: parent.right
                            anchors.bottom: currentLabel.bottom
                            font: Fonts.body_20
                            text: "??C"
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
            source: PrintManager.isLightOn ? "../../icon/light_on.svg" : "../../icon/light.svg"
        }

        ZText {
            x: 80
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("?????????")
            font: Fonts.body_18
        }

        TapHandler {
            onTapped: {
                PrintManager.isLightOn = !PrintManager.isLightOn
            }
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

            onTargetChanged: {
                if (target != null)
                    filamentPad.target = null
            }
        }

        FilamentPad {
            id: filamentPad
            anchors.fill: parent

            onTargetChanged: {
                if (target != null)
                    numberPad.target = null
            }
        }

        TapHandler {
            onTapped: {
                dialogStack.popDialog("PrintFailed", { model: {imageUrl: "qrc:/uibase/icon/fish_test.jpg"}})
            }
        }
    }

    ZText {
        id: desc
        anchors.centerIn: parent
        font: Fonts.body_40
        color: "#40000000"
        text: qsTr("?????????MainPage.qml???")
    }
}
