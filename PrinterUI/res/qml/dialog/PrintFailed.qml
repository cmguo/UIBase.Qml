import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "怀疑机器哪部分不工作，会影响模型效果，请点开查看"
    property var buttons: [ "我知道了"]
    property int defaultButton: 0

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
        text: qsTr("PrintWarning.qml")
    }

}
