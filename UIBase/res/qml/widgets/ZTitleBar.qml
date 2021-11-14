import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


import "./"
//import QtGraphicalEffects 1.0

Rectangle {
    width: parent.width
    height: visible ? Destiny.dp(80) : 0
    color: "#F8F8F8"
    clip: false

    property string title: "标 题"
    property string titleColor: "#2B2B2B"

    ZText {
        id: paper_title
        height: implicitHeight
        width: implicitWidth
        text: title
        font.pixelSize: Destiny.sp(24)
        color: titleColor
        anchors.centerIn: parent
        leftPadding: Destiny.dp(20)
        rightPadding: Destiny.dp(20)
        singleLine: true
        anchors.top: parent.top
    }

    Rectangle {
        id: shadow
        width: parent.width
        height: Destiny.dp(1)
        color: "#E2E3E4"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: height * -1
    }

}

