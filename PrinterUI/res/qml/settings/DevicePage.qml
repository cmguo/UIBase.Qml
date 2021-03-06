import QtQuick 2.0
import QtQuick.Controls 2.2
import UIBase 1.0
import Printer 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var build: DeviceManager.build

    Rectangle {
        id: sdcard
        width: 541
        height: 300
        x: 14
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: sdTitle
            height: 34
            x: 42
            y: 35
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("SD卡容量")
        }

        ZText {
            id: sdUsage
            anchors.left: sdTitle.left
            anchors.top: sdTitle.bottom
            anchors.topMargin: 22
            font: Fonts.body_24
            color: "#7C7C7C"
            text: qsTr("2.4G 已用（共4G）")
        }

        ZProgressBar {
            id: sdProgressBar
            width: 337
            type: ZProgressBarAppearance.Secondary
            size: ZProgressBarAppearance.Middle
            anchors.left: sdTitle.left
            anchors.top: sdUsage.bottom
            anchors.topMargin: 24
            value: 0.5
        }

        ZButton {
            width: 203
            height: 70
            anchors.left: sdTitle.left
            anchors.top: sdProgressBar.bottom
            anchors.topMargin: 30
            cornerRadius: 20
            borderWidth: 1
            textColor: StateColors.get(Colors.font2)
            backgroundColor: StateColors.get("transparent")
            borderColor: StateColors.get("#555555")
            text: "格式化"
        }
    }

    Rectangle {
        id: cert
        height: sdcard.height
        anchors.left: sdcard.right
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.top: sdcard.top
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: certTitle
            x: 42
            y: 35
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("认证")
        }
    }

    Rectangle {
        id: info
        height: 165
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 32
        anchors.top: sdcard.bottom
        anchors.topMargin: 20
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: infoTitle
            x: 50
            y: 35
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("关于本机")
        }

        ZText {
            id: infoDetail
            anchors.left: infoTitle.left
            anchors.top: infoTitle.bottom
            anchors.topMargin: 22
            font: Fonts.body_24
            color: "#7C7C7C"
            text: qsTr("版本 : " + build.version + "            型号: " + build.product + "           序列号: " + build.seriaNO)
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("DevicePage.qml")
    }

}
