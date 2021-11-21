import QtQuick 2.0
import UIBase 1.0

Item {

    anchors.fill: parent

    Image {
        anchors.centerIn: parent
        source: ""
        visible: false
    }


    Rectangle {
        id: info
        height: 165
        anchors.left: parent.left
        anchors.leftMargin: 68
        anchors.right: parent.right
        anchors.rightMargin: 95
        radius: 20
        color: Colors.lightbg2
        visible: true

        Image {
            id: userIcon
            width: 120
            height: 120
            x: 15
            anchors.verticalCenter: parent.verticalCenter
            source: "file"
        }

        ZText {
            id: userName
            anchors.left: userIcon.right
            anchors.leftMargin: 25
            y: 47
            font: Fonts.body_36
            color: Colors.font2
            text: "Bambu"
        }

        ZText {
            id: infoDetail
            anchors.left: userName.left
            anchors.top: userName.bottom
            anchors.topMargin: 22
            font: Fonts.body_24
            color: "#7C7C7C"
            text: qsTr("已打印3968米，还差32米晋升白金会员")
        }

        ZButton {
            anchors.right: parent.right
            anchors.rightMargin: 55
            anchors.verticalCenter: parent.verticalCenter
            type: ZButtonAppearance.Secondary
            text: "退出"
        }
    }

    Image {
        id: qrcode
        anchors.centerIn: parent
        sourceSize: Qt.size(319, 319)
        source: "image://QZXing/encode/https://blog.csdn.net/luansxx?requestSize=   "
    }


    Text {
        id: desc
        anchors .centerIn: parent
        font.pointSize: 40
        text: qsTr("UserPage.qml")
    }
}
