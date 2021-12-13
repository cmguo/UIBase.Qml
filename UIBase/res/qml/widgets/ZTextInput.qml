import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0
import "../view"

Item {

    id: button

    ZButtonAppearance {
        id: ap
        type: ZButtonAppearance.Primitive
        size: ZButtonAppearance.Large
    }

    property alias type: ap.type
    property alias size: ap.size
    property alias appearance: ap.appearance

    property alias textColor: ap.textColor
    property alias backgroundColor: ap.backgroundColor
    property alias borderColor: ap.borderColor
    property alias iconColor: ap.iconColor
    property alias iconPosition: ap.iconPosition
    property alias minHeight: ap.minHeight
    property alias cornerRadius: ap.cornerRadius
    property alias borderWidth: ap.borderWidth
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

        implicitWidth: contentLayout.width + ap.paddingX * 2
        anchors.fill: parent
        radius: ap.cornerRadius
        color: backgroundColor.color
        border.width: borderWidth
        border.color: borderColor.color

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
                font.family: Fonts.family
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

        Loader {
            id: loading
            sourceComponent: Item {
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
    }

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: {
            if (loading) {
                return
            }
            button.clicked()
        }
    }

    HoverHandler {}

    StateColorHandler {
        id: textColor
        stateColor: ap.textColor
    }

    StateColorHandler {
        id: backgroundColor
        stateColor: ap.backgroundColor
    }

    StateColorHandler {
        id: borderColor
        stateColor: ap.borderColor
    }

}
