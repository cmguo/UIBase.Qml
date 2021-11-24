import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "检测出模型打印已经失败，已停止打印"
    property var buttons: [ "我知道了", "查看原因"]
    property int defaultButton: 1

    property var plate

    function buttonClicked(index) {
        console.log("buttonClicked " + index)
    }

    width: 0
    height: 0

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("PrintFailed.qml")
    }

}
