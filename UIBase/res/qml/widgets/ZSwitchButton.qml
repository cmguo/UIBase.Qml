import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0

Switch {

    id: control

    ZSwitchButtonAppearance {
        id: ap
        type: ZSwitchButtonAppearance.Primitive
        size: ZSwitchButtonAppearance.Large
    }

    property alias type: ap.type
    property alias size: ap.size
    property alias appearance: ap.appearance

    property alias textColor: ap.textColor
    property alias backgroundColor: ap.backgroundColor
    property alias iconColor: ap.iconColor
    property alias iconPosition: ap.iconPosition
    property alias borderWidth: ap.borderWidth
    property alias textSize: ap.textSize
    property alias iconSize: ap.iconSize
    property alias iconPadding: ap.iconPadding

    indicator: Rectangle {
        implicitWidth: icon.height * 2 + ap.borderWidth
        height: icon.height + ap.borderWidth * 2
        anchors.verticalCenter: parent.verticalCenter
        radius: height / 2
        color: backgroundColor.color

        Rectangle {
            id: icon
            width: height
            height: ap.iconSize
            x: control.checked ? parent.width - width - ap.borderWidth : ap.borderWidth
            radius: height / 2
            anchors.verticalCenter: parent.verticalCenter
            color: iconColor.color
        }
    }

    contentItem: Text {
        id: textContent
        anchors.verticalCenter: parent.verticalCenter
        font.family: Fonts.family
        font.pixelSize: ap.textSize
        color: iconColor.color
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + ap.iconPadding
        text: control.text
    }

    TapHandler {}

    StateColorHandler {
        id: backgroundColor
        stateColor: ap.backgroundColor
    }

    StateColorHandler {
        id: iconColor
        stateColor: ap.iconColor
    }

    StateColorHandler {
        id: textColor
        stateColor: ap.textColor
    }

}
