import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0

import "./"

Item {

    id: toastRoot

    width: testLayout.width
    height: testLayout.height

    property var minWidth: Destiny.dp(288)
    property var maxWidth: Destiny.dp(688)

    property var description: "Loading ..."
    property var icon: ""

    signal onSizeChanged(int w, int h);

    Rectangle {
        id: testLayout

        anchors.centerIn: parent

        width: descriptionLayout.width + contentLayout.anchors.leftMargin + contentLayout.anchors.rightMargin
        height: iconLayout.height + descriptionLayout.height + descriptionLayout.anchors.topMargin + contentLayout.anchors.topMargin + contentLayout.anchors.bottomMargin
        color: "#2B3034"
        radius: Destiny.dp(8)

        onWidthChanged: {
             quickWidgetParent.onQMLSizeChanged(width,height)
        }

        onHeightChanged: {
            quickWidgetParent.onQMLSizeChanged(width,height)
        }

        Item {
            id: contentLayout

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: Destiny.dp(16)
            anchors.bottomMargin: Destiny.dp(32)
            anchors.leftMargin: Destiny.dp(32)
            anchors.rightMargin: Destiny.dp(32)

            width: parent.width - anchors.leftMargin - anchors.rightMargin
            height: parent.height - anchors.topMargin - anchors.bottomMargin

            Item {
                id: iconLayout
                width: Destiny.dp(64)
                height: progressImageLayout.visible ? Destiny.dp(64) :  Destiny.dp(8)
                anchors.horizontalCenter: parent.horizontalCenter

                Item {
                    id: progressImageLayout
                    anchors.fill: parent
                    visible: icon !== "" && icon !== null

                    AnimatedImage {
                        id: progressImage
                        anchors.fill: parent
                        source: icon
                        playing: true
                        visible: true
                        onSourceChanged: {
                            progressImage.playing = true
                        }
                    }
                }
            }

            Item {
                id: descriptionLayout
                width: descriptionText.width
                height: descriptionText.height
                anchors.top: iconLayout.bottom
                anchors.topMargin: Destiny.dp(8)
                anchors.horizontalCenter: parent.horizontalCenter

                ZText {
                    id: descriptionText
                    anchors.centerIn: parent
                    font.pixelSize: Destiny.sp(16)

                    property int textMinWidth: minWidth - contentLayout.anchors.leftMargin - contentLayout.anchors.rightMargin
                    property int textMaxWidth: maxWidth - contentLayout.anchors.leftMargin - contentLayout.anchors.rightMargin

                    width: {
                        if(implicitWidth > textMinWidth) {
                            return Math.min(implicitWidth, textMaxWidth);
                        }
                        return textMinWidth;
                    }

                    color: "#FFFFFF"
                    text: description
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    ZHandler {
        id: handler
    }


    function makeToast( msg,icon, duration) {
        var iconFigure = getIcon(icon)
        if(iconFigure !== -1) {
            icon = iconFigure
        }
        toastRoot.visible = true;
        toastRoot.icon = icon;
        toastRoot.description = msg;
        handler.delay(duration,function() {
            toastRoot.visible = false;
        });
    }


    function getIcon(status) {
        if(status === "") {
            return -1;
        }
        if(status === 2) {
            return "qrc:/uibase/drawable/uibase_toast_loading.gif"
        } else if (status === 1) {
           return "qrc:/uibase/drawable/uibase_toast_success.svg"
        } else if (status === 0) {
           return "qrc:/uibase/drawable/uibase_toast_error.svg"
        } else {
            return -1
        }
    }

}
