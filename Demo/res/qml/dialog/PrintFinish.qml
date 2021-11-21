import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var model

    width: 924
    height: 553

    Rectangle {
        anchors.fill: parent
        radius: 15
        color: Colors.lightbg2

        ZText {
            x: 102
            y: 80
            font: Fonts.head_30
            text: "打印完成"
        }

        Image {
            id: image
            width: 205
            height: 205
            x: 102
            y: 148
            source: model.imageUrl
        }

        ZText {
            anchors.left: image.right
            anchors.leftMargin: 30
            y: 137
            lineHeight: 1.5
            singleLine: false
            font: Fonts.body_24
            text: "文件名：Robot
当前盘：2/4盘
打印用时：4小时30分钟
已用材料：1.红色PLA  80g     2.绿色CPE    60g
                   3.黄色PLA 18g      4.橙色PLA    23g"
        }

        ZButton {
            anchors.top: button2.top
            anchors.right: button2.left
            anchors.rightMargin: 21
            type: ZButtonAppearance.Secondary
            text: "打印下一盘"
            onClicked: {
                printManager.printModel(model.name);
            }
        }

        ZButton {
            id: button2
            anchors.right: parent.right
            anchors.rightMargin: 43
            y: 42
            type: ZButtonAppearance.Secondary
            text: "彩色打印"
            onClicked: {
                printManager.printModel(model.name);
            }
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("PrintFinish.qml")
    }
}
