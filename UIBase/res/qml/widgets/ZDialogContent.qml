import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0


import "./"
import "qrc:/uibase/qml/talwidget/styles"


Rectangle {
    id: content
    width: columnLayout.implicitWidth + columnLayout.anchors.leftMargin + columnLayout.anchors.rightMargin
    height: columnLayout.implicitHeight + columnLayout.anchors.topMargin + columnLayout.anchors.bottomMargin
    color: "white"
    radius: Destiny.dp(8)
    anchors.fill: parent
    border.width: Destiny.dp(1)
    border.color: "#CDCDCD"

    Rectangle  {
        id: columnLayout

        implicitWidth: contentTextLayout.width
        implicitHeight: childrenRect.height

        color: "transparent"

        anchors.left: parent.left
        anchors.leftMargin: Destiny.dp(32)
        anchors.top: parent.top
        anchors.topMargin: Destiny.dp(48)
        anchors.right: parent.right
        anchors.rightMargin: Destiny.dp(32)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Destiny.dp(24)

        Rectangle {
            id:contentTextLayout
            width:  Destiny.dp(230)
            height: Destiny.dp(53)
            color: "transparent"
            clip: true

            ZText {
                id: contentText
                text: textContent
                width: parent.width
                height: implicitHeight
                color: "#2B2B2B"
                font.pixelSize: Destiny.sp(16)
                maximumLineCount: 2
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id:buttonLayout
            clip: true
            anchors.top: contentTextLayout.bottom
            anchors.topMargin: Destiny.dp(16)
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height

            color: "transparent"

            ZButton {
                id: confirmButton
                talStyle: ZButtonStylePrimary { size: ZButtonStyle.Size.S }
                height: Destiny.dp(40)
                width: Destiny.dp(100)
                text: confirmButtonText
                onClicked: {
                    confirmClick();
                    close()
                }
            }

            ZButton {
                id: cancelButton
                talStyle: ZButtonStyleGhostSecondary { size: ZButtonStyle.Size.S }
                height: Destiny.dp(40)
                width: visible ? Destiny.dp(100) : 0
                anchors.left: confirmButton.right
                anchors.leftMargin: visible ?  Destiny.dp(28) : 0
                visible: !onlyConfirmButton
                text: cancelButtonText
                onClicked: {
                    cancelClick()
                    close()
                }
            }

        }
    }
}
