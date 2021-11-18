import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0

import "./"

Item {

    id: button

    ZButtonAppearance {
        id: ap
        buttonType: ZButtonAppearance.Primitive
        buttonSize: ZButtonAppearance.Large
    }

    property alias buttonType: ap.buttonType
    property alias buttonSize: ap.buttonSize
    property alias appearance: ap.appearance

    property alias textColor: ap.textColor
    property alias backgroundColor: ap.backgroundColor
    property alias iconColor: ap.iconColor
    property alias iconPosition: ap.iconPosition
    property alias minHeight: ap.minHeight
    property alias cornerRadius: ap.cornerRadius
    property alias paddingX: ap.paddingX
    property alias paddingY: ap.paddingY
    property alias textSize: ap.textSize
    property alias iconSize: ap.iconSize
    property alias iconPadding: ap.iconPadding

    property alias text: textContent.text
    property alias icon: icon.source

    signal clicked();

    property string loadingIcon
    property bool loading: false

    width: background.implicitWidth
    height: Math.max(ap.minHeight, background.implicitHeight)

    Rectangle {
        id: background

        property bool loading: false
        property string text: ""

        implicitWidth: contentLayout.width + radius * 2
        width: parent.width
        height: parent.height
        radius: ap.cornerRadius
        color: backgroundColor.color

        //Behavior on color {
        //    PropertyAnimation { duration: 200}
        //}

        Item {
            id: contentLayout
            width: icon.width + textContent.width + textContent.anchors.leftMargin
            height: parent.height
            anchors.centerIn: parent
            visible: !loading

            Image {
                id: icon
                width: source != "" ? ap.iconSize : 0
                height: source != "" ? ap.iconSize : 0
                anchors.verticalCenter: parent.verticalCenter
                visible: source != ""
            }

            Text {
                id: textContent
                width: implicitWidth
                height: implicitHeight
                color: textColor.color
                font.pixelSize: ap.textSize
                anchors.left: icon.right
                anchors.leftMargin: icon.source != "" && text != "" ? Destiny.dp(ap.iconPadding) : 0
                wrapMode: Text.Normal
                verticalAlignment: TextInput.AlignVCenter
                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter

                //Behavior on color {
                //    PropertyAnimation { duration: 200}
                //}
            }
        }

        Item {
            id:loadingLayout
            visible: loading
            width: parent.width
            height: parent.height

            AnimatedImage  {
                height: parent.height - Destiny.dp(2)
                width: height
                smooth: true
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                visible: parent.visible
                source: visible ? loadingIcon : ""
                playing: true
                antialiasing: true
            }

        }
    }

    TapHandler {
        id: tapHandler
        onTapped: {
            if (loading) {
                return
            }
            button.clicked()
        }
    }

    HoverHandler {}

    StateColor {
        id: textColor
        colors: ap.textColor
    }

    StateColor {
        id: backgroundColor
        colors: ap.backgroundColor
    }

}
