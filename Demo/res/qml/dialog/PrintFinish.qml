import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "打印完成"
    property var buttons: [ "打印下一盘", "任务完成", "打印失败" ]
    property int defaultButton: 0

    property var model

    width: text.x + text.contentWidth
    height: text.contentHeight

    Image {
        id: image
        width: 205
        height: 205
        source: model.imageUrl
    }

    ZText {
        id: text
        anchors.left: image.right
        anchors.leftMargin: 30
        lineHeight: 1.5
        singleLine: false
        font: Fonts.body_24
        text: "文件名：Robot
当前盘：2/4盘
打印用时：4小时30分钟
已用材料：1.红色PLA  80g     2.绿色CPE    60g
               3.黄色PLA 18g      4.橙色PLA    23g"
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("PrintFinish.qml")
    }
}
