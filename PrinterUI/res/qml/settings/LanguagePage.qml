import QtQuick 2.0
import UIBase 1.0
import Printer 1.0

Item {

    ZButton {
        id: chinese
        width: 261
        height: 115
        x: 73
        property bool checked: DeviceManager.language == "cn"
        backgroundColor: StateColors.get("white_checked")
        text: "中文"

        onClicked: { DeviceManager.language = "cn" }
    }

    ZButton {
        width: 261
        height: 115
        anchors.left: chinese.right
        anchors.leftMargin: 31
        anchors.top: chinese.top
        property bool checked: DeviceManager.language == "en"
        backgroundColor: StateColors.get("white_checked")
        text: "English"

        onClicked: { DeviceManager.language = "en" }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("LanguagePage.qml")
    }

}
