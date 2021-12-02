import QtQuick 2.0
import UIBase 1.0

Item {

    Rectangle {
        id: timelaspe
        width: 501
        height: 385
        x: 44
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: timelaspeTitle
            height: 30
            x: 49
            y: 34
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("Timelapse")
        }

        ZText {
            id: bitrateTitle
            height: 30
            anchors.left: timelaspeTitle.left
            anchors.top: timelaspeTitle.bottom
            anchors.topMargin: 48
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("分辨率")
        }

        ZText {
            id: bitrateValue
            height: 30
            x: 376
            anchors.top: bitrateTitle.top
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("720P")
        }

        ZText {
            id: circleTitle
            height: 30
            anchors.left: bitrateTitle.left
            anchors.top: bitrateTitle.bottom
            anchors.topMargin: 64
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("循环录制")
        }

        ZSwitch {
            id: circleButton
            anchors.left: bitrateValue.left
            anchors.verticalCenter: circleTitle.verticalCenter
            checked: true
        }

        ZText {
            id: autoTitle
            height: 30
            anchors.left: circleTitle.left
            anchors.top: circleTitle.bottom
            anchors.topMargin: 65
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("自动录制")
        }

        ZSwitch {
            id: autoButton
            anchors.left: bitrateValue.left
            anchors.verticalCenter: autoTitle.verticalCenter
            checked: true
        }
    }

    Rectangle {
        id: recorder
        height: 358
        anchors.left: timelaspe.right
        anchors.leftMargin: 21
        anchors.right: parent.right
        anchors.rightMargin: 68
        anchors.top: timelaspe.top
        radius: 20
        color: Colors.lightbg2

        ZText {
            id: recorderTitle
            height: 30
            x: 51
            y: 34
            font: Fonts.head_30
            color: Colors.font2
            text: qsTr("监控录像")
        }

        ZText {
            id: bitrateTitle2
            height: 30
            anchors.left: recorderTitle.left
            anchors.top: recorderTitle.bottom
            anchors.topMargin: 51
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("分辨率")
        }

        ZText {
            id: bitrateValue2
            height: 30
            x: 364
            anchors.top: bitrateTitle2.top
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("720P")
        }

        ZText {
            id: circleTitle2
            height: 30
            anchors.left: bitrateTitle2.left
            anchors.top: bitrateTitle2.bottom
            anchors.topMargin: 57
            font: Fonts.body_30
            color: Colors.font2
            text: qsTr("循环录制")
        }

        ZSwitch {
            id: circleButton2
            anchors.left: bitrateValue2.left
            anchors.verticalCenter: circleTitle2.verticalCenter
            checked: false
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("RecorderPage.qml")
    }

}
