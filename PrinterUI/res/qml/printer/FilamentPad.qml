import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string ftype: types.currentText
    property string fcolor: ""

    property var target: null

    id: pad
    visible: target != null

    Rectangle {
        anchors.fill: parent
        radius: 20
        color: Colors.lightbg2

        Item {
            x: 44
            y: 44

            ZText {
                font: Fonts.head_30
                text: "材质"
            }

            ComboBox {
                id: types
                y: 44
                width: 308
                height: 60
                font: Fonts.body_28
                popup.font: Fonts.body_28
                model: ["PLA", "PETG", "ABS", "ASA", "FLEX"]
                currentIndex: -1
                displayText: currentIndex == -1 ? "点击选择材质" : currentText
            }

            ZText {
                y: 148
                font: Fonts.head_30
                text: "颜色"
            }

            Rectangle {
                id: color
                width: 100
                height: 100
                y: 188
                radius: 15
                color: fcolor == "" ? "#F0F0F0" : fcolor
                border.width: 1
                border.color: "#2C2C2E"

                Text {
                    anchors.centerIn: parent
                    font: Fonts.body_32
                    color: "#AEAEAE"
                    text: "?"
                    visible: fcolor == ""
                }

                TapHandler {
                    onTapped: {
                        colorPad.visible = true
                    }
                }
            }

            Rectangle {
                id: colorPad
                x: 114
                y: 188
                width: 343
                height: 221
                radius: 20
                color: Colors.lightbg2
                visible: false

                GridView {
                    anchors.fill: parent
                    anchors.margins: 10
                    cellWidth: 56
                    cellHeight: 56
                    model: ["#FFFFFF", "#DD4646", "#FFF734", "#AFF31E", "#57CA5B",
                        "#41D3B0", "#35B7E0", "#2B7BF3", "#6553D4", "#AF4CD1",
                        "#E057A1", "#6C4820", "#223371", "#000000"
                    ]
                    delegate: Rectangle {
                        width: 48
                        height: 48
                        radius: 15
                        color: modelData
                        border.color: index == 0 ? "black" : "transparent"
                        TapHandler {
                            onTapped: {
                                fcolor = modelData
                                colorPad.visible = false
                            }
                        }
                    }
                }
            }
        } // edit area

        Item {
            x: 547
            y: 44

            ZText {
                font: Fonts.head_30
                text: "最近使用过的材质"
            }

            Rectangle {
                width: 224
                height: list.contentHeight + 60
                y: 68
                radius: 20
                color: "white"

                ListView {
                    id: list
                    anchors.fill: parent
                    anchors.margins: 30
                    spacing: 37
                    model: printManager.amsList
                    delegate: Item {
                        width: 180
                        height: 30
                        Rectangle {
                            width: 30
                            height: 30
                            radius: 10
                            color: fcolor
                        }
                        ZText {
                            height: 30
                            x: 45
                            font: Fonts.body_28
                            text: name
                        }

                        TapHandler {
                            onTapped: {
                                pad.fcolor = fcolor
                                types.currentIndex = types.model.indexOf(name)
                            }
                        }
                    }
                }
            }
        }
    } // recent

    Item {
        x: 47
        y: 537

        ZButton {
            width: 128
            textSize: 30
            property bool checked: true
            text: "确定"

            onClicked: {
                pad.target = null
            }
        }

        ZButton {
            width: 128
            x: 151
            type: ZButtonAppearance.Secondary
            textSize: 30
            text: "取消"

            onClicked: {
                pad.target = null
            }
        }
    }

    onTargetChanged: {
        fcolor = ""
        types.currentIndex = -1
    }

}
