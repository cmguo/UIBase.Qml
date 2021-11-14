import QtQuick 2.0

import "qrc:/uibase/qml/talwidget"

import TalDisplay 1.0

Rectangle {
    color: "#FFFFFF"

    TalImage{
        width: Destiny.dp(398)
        height: Destiny.dp(184)
        source: "qrc:/uibase/drawable/uibase_splash_logo.svg"
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent

        TalText {
            text: "正在载入"
            color: "#959595"
            font.pixelSize: Destiny.dp(14)
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: Destiny.dp(111)
            anchors.rightMargin: Destiny.dp(43)
        }
    }

    TalText {
        text: "UIBase Library V1.0, powed by @Tal Team."
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Destiny.dp(44)
        color: "#868686"
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
