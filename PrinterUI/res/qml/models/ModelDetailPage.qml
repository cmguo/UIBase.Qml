import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var model

    Rectangle {
        height: 548
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.right: parent.right
        anchors.rightMargin: 45
        radius: 20
        color: Colors.lightbg2

        Image {
            id: image
            width: 205
            height: 205
            x: 36
            y: 36
            source: model.imageUrl
        }

        ZText {
            anchors.left: image.right
            anchors.leftMargin: 51
            y: 26
            lineHeight: 1.5
            singleLine: false
            font: Fonts.body_24
            text: "格式：3mf
分盘数：4盘
打印时间：4小时30分钟
需要材料：1.红色PLA    80g      2.绿色CPE    60g
                   3.黄色PLA   18g       4.橙色PLA    23g
文件（请登录APP或PC客户端查看）：
                       1.BOM_物料清单.xlsx"
        }

        ZButton {
            anchors.top: button2.top
            anchors.right: button2.left
            anchors.rightMargin: 21
            type: ZButtonAppearance.Secondary
            text: "单色打印"
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
        color: "#40000000"
        text: qsTr("ModelListPage.qml")
    }
}
