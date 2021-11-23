import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "料已从挤出头内退出，请手动更换材料"
    property var buttons: [ "我换好了", "取消打印"]
    property int defaultButton: 0

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
        text: qsTr("ReplaceFilament.qml")
    }

}
