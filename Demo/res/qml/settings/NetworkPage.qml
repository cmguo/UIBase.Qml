import QtQuick 2.0
import UIBase 1.0

Item {

    anchors.fill: parent

    Rectangle {
        id: info
        height: 358
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.right: parent.right
        anchors.rightMargin: 45
        y: 20
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
            text: "IP 地址: 192.168.192.142
子网掩码：255.255.254.0
默认网关：192.168.192.1
DNS服务器：192.168.192.1"
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("NetworkPage.qml")
    }
}
