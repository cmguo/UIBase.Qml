import QtQuick 2.0
import UIBase 1.0

Item {

    anchors.fill: parent

    property string language: "chinese"

    ZButton {
        id: chinese
        width: 261
        height: 115
        x: 73
        y: 20
        property bool checked: language == "chinese"
        backgroundColor: StateColors.get("white_checked")
        text: "中文"

        onClicked: { language = "chinese" }
    }

    ZButton {
        width: 261
        height: 115
        anchors.left: chinese.right
        anchors.leftMargin: 31
        anchors.top: chinese.top
        property bool checked: language == "english"
        backgroundColor: StateColors.get("white_checked")
        text: "English"

        onClicked: { language = "english" }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("LanguagePage.qml")
    }

}
