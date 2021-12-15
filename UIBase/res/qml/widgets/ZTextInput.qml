import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0
import "../view"

Item {

    id: button

    ZTextInputAppearance {
        id: ap
        type: ZTextInputAppearance.Primitive
        size: ZTextInputAppearance.Large
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
    property bool focused: textContent.activeFocus
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

            TextInput {
                id: textContent
                width: implicitWidth
                height: implicitHeight
                anchors.left: icon.right
                anchors.leftMargin: icon.source != "" && text != "" ? Destiny.dp(ap.iconPadding) : 0
                color: textColor.color
                focus: true
                font.family: Fonts.family
                font.pixelSize: ap.textSize
                wrapMode: TextInput.Normal
                verticalAlignment: TextInput.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter

                //Behavior on color {
                //    PropertyAnimation { duration: 200}
                //}

                onEditingFinished: {

                }
            }

        }
    }

    HoverHandler {}

    TapHandler {
        onTapped: textContent.forceActiveFocus()
    }

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
