import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    anchors.fill: parent

    Rectangle {
        id: ams
        width: 547
        height: 363
        x: 48
        radius: 20
        color: Colors.lightbg2

        property int selectAMS: 0

        ZText {
            x: 46
            y: 41
            font: Fonts.body_20
            text: "请指定对应仓位上/退料："
        }

        Repeater {
            model: [{
                    color: "#F3942B"
                }, {
                    color: "#EE4633"
                }, {
                    color: "#22A0FB"
                }, {
                    color: "#35D692"
                }]
            delegate: ZButton {
                width: 80; height: 80
                x: 47 + 120 * index
                y: 114
                cornerRadius: 15
                borderWidth: 5
                textSize: 30
                backgroundColor: StateColors.get(modelData.color)
                borderColor: StateColor {
                    StateColorItem { color: "#404040"; states: StateColor.Checked }
                    StateColorItem { color: "transparent"; states: StateColor.Normal }
                }
                property bool checked: ams.selectAMS === index
                text: index + 1
                onClicked: {
                    ams.selectAMS = index
                }
            }
        }

        ZButton {
            x: 47
            y: 257
            type: ZButtonAppearance.Secondary
            textSize: 30
            text: "上料"
        }

        ZButton {
            x: 286
            y: 257
            type: ZButtonAppearance.Secondary
            textSize: 30
            text: "下料"
        }
    }

    ZStepBar {
        anchors.left: ams.right
        anchors.leftMargin: 91
        y: 36
        stepColor: Colors.brand
        steps: ["选择指定仓位", "点击上(退)料按钮", "1号仓正在退出原仓内料", "正在上料", "完成"]
    }

    Repeater {
        model: 5

    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("AMSPage.qml")
    }
}
