import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "模型文件与舱内材料颜色有冲突"
    property var buttons: [ "继续打印", "我要换料", "编辑颜色", "取消打印"]
    property int defaultButton: 1

    property var plate

    function buttonClicked(index) {
        console.log("buttonClicked " + index)
    }

    width: 205
    height: 247

    Image {
        id: image
        width: 205
        height: 205
        source: plate.snapshot
    }

    Text {
        anchors.top: image.bottom
        anchors.topMargin: 22
        anchors.horizontalCenter: parent.horizontalCenter
        font: Fonts.body_20
        color: "#696969"
        text: "颜色近似匹配结果"
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("ColorConflict.qml")
    }

}
