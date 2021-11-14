import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


import "./"

Item {

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

    width: talButtonRoot.implicitWidth
    height: max(ap.minHeight, talButtonRoot.implicitHeight)

    Rectangle {
        id: talButtonRoot

        property bool loading: false
        property string text: ""

        implicitWidth: contentLayout.width + radius * 2
        width: parent.width
        height: parent.height
        radius: ap.cornerRadius
        color: stateHandler.mapColor(ap.backgroundColor).color

        Behavior on color {
            PropertyAnimation { duration: 200}
        }

        Item {
            id: contentLayout
            width: icon.width + textContent.width + textContent.anchors.leftMargin + rightIcon.anchors.leftMargin
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            visible: !loading

            Image {
                id: icon
                width: ap.iconSize
                height: ap.iconSize
                anchors.verticalCenter: parent.verticalCenter
                visible: source != ""
            }

            Text {
                id: textContent
                width: implicitWidth
                height: implicitHeight
                color: stateHandler.mapColor(ap.textColor).color
                font.pixelSize: ap.textSize
                font.family: talButtonRoot.talStyle.fontFamily
                anchors.left: leftIcon.right
                anchors.leftMargin: icon.source != "" && text != "" ? Destiny.dp(ap.iconPadding) : 0
                wrapMode: Text.Normal
                verticalAlignment: TextInput.AlignVCenter
                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter

                Behavior on color {
                    PropertyAnimation { duration: animDuration}
                }
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
                source: visible ? talStyle.loadingSource : ""
                playing: true
                antialiasing: true
            }

        }

        signal clicked();

        TapHandler {
            id: tapHandler
            onTapped: {
                if (loading) {
                    return
                }
                handler.delay(250, function() {
                    talButtonRoot.clicked()
                })
            }
        }

        HoverHandler {}

        StateHandler {
            id: stateHandler
        }

    }

}
