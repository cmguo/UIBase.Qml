import QtQuick 2.0
import UIBase 1.0
import Printer 1.0

Item {

    property var network: DeviceManager.network

    Rectangle {
        id: info
        height: 358
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.right: parent.right
        anchors.rightMargin: 45
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: infoTitle
            x: 65
            y: 34
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("配置IPV4：")
        }

        ZText {
            id: infoDetail
            anchors.left: infoTitle.left
            anchors.top: infoTitle.bottom
            anchors.topMargin: 31
            font: Fonts.body_24
            color: Colors.font2
            singleLine: false
            lineHeight: 1.5
            text: "IP 地址: " + network.ipv4  +  "
子网掩码：" + network.mask  +  "
默认网关：" + network.gateway  +  "
DNS服务器：" + network.dns
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("NetworkPage.qml")
    }
}
