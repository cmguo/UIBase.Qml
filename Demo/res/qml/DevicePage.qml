import QtQuick 2.0
import QtQuick.Controls 2.2
import "qrc:/uibase/qml/widgets"

Item {

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "#345678"

        Item {
            id: topArea
            anchors.margins: 10
            anchors.left: parent.left
            anchors.top: parent.top
            width: parent.width
            height: 300

            Rectangle {
                id: sdcard
                width: parent.width / 2 - 20
                height: parent.height - 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 10
                radius: 20
                color: "gray"

                Text {
                    id: sdTitle
                    anchors.left: parent.left
                    anchors.leftMargin: 42
                    anchors.top: parent.top
                    anchors.topMargin: 35
                    text: qsTr("SD卡容量")
                    font.pixelSize: 30
                    color: "white"
                }

                Text {
                    id: sdUsage
                    anchors.left: parent.left
                    anchors.leftMargin: 42
                    anchors.top: sdTitle.bottom
                    anchors.topMargin: 22
                    text: qsTr("2.4G 已用（共4G）")
                    font.pixelSize: 20
                    color: "#AAAAAA"
                }

                ProgressBar {
                    id: sdProgressBar
                    anchors.left: parent.left
                    anchors.leftMargin: 42
                    anchors.top: sdUsage.bottom
                    anchors.topMargin: 24
                    value: 0.5
                }

                ZButton {
                    anchors.left: parent.left
                    anchors.leftMargin: 42
                    anchors.top: sdProgressBar.bottom
                    anchors.topMargin: 30
                    text: "格式化"
                }
            }

            Rectangle {
                id: cert
                width: parent.width / 2 - 20
                height: parent.height - 20
                anchors.left: sdcard.right
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 10
                radius: 20
                color: "gray"

                Text {
                    id: certTitle
                    anchors.left: parent.left
                    anchors.leftMargin: 42
                    anchors.top: parent.top
                    anchors.topMargin: 35
                    text: qsTr("认证")
                    font.pixelSize: 30
                    color: "white"
                }
            }
        }

        Rectangle {
            id: info
            width: parent.width - 20
            height: 165
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: topArea.bottom
            anchors.topMargin: 20
            radius: 20
            color: "gray"

            Text {
                id: infoTitle
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: parent.top
                anchors.topMargin: 35
                text: qsTr("关于本机")
                font.pixelSize: 30
                color: "white"
            }

            Text {
                id: infoDetail
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: infoTitle.bottom
                anchors.topMargin: 22
                text: qsTr("版本 : V1.0.1            型号: BBL-003           序列号: 603462021110200001")
                font.pixelSize: 20
                color: "#AAAAAA"
            }
        }

        Text {
            id: desc
            anchors.centerIn: parent
            font.pixelSize: 40
            text: qsTr("DevicePage.qml")
        }

    }
}
