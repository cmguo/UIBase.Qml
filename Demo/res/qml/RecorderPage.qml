import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    anchors.fill: parent

    Rectangle {
        id: info
        width: parent.width - 20
        height: 165
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: topArea.bottom
        anchors.topMargin: 20
        radius: 20
        color: "#F8F8F8"

        ZText {
            id: infoTitle
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 35
            font: Fonts.head_30
            color: "#2C2C2E"
            text: qsTr("关于本机")
        }

        ZText {
            id: infoDetail
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: infoTitle.bottom
            anchors.topMargin: 22
            font: Fonts.body_24
            color: "#7C7C7C"
            text: qsTr("版本 : V1.0.1            型号: BBL-003           序列号: 603462021110200001")
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("RecorderPage.qml")
    }

}
