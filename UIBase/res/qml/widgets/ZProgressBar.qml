import QtQuick 2.0
import QtQuick.Controls 2.0
import UIBase 1.0

ProgressBar {

    ZProgressBarAppearance {
        id: ap
        type: ZProgressBarAppearance.Primitive
        size: ZProgressBarAppearance.Large
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

    property var progressColor
    property alias text: textContent.text

    id: control

    background: Rectangle {
        height: ap.iconSize
        radius: ap.cornerRadius
        color: backgroundColor.color
    }
    contentItem: Item {
        Rectangle {
            width: control.visualPosition * parent.width
            height: ap.iconSize
            radius: ap.cornerRadius
            color: iconColor.color
        }

        Text {
            id: textContent
            anchors.centerIn: parent
            font.family: Fonts.family
            font.pixelSize: ap.textSize
            verticalAlignment: Text.AlignVCenter
        }
    }

    StateColorHandler {
        id: backgroundColor
        stateColor: ap.backgroundColor
    }

    StateColorHandler {
        id: iconColor
        stateColor: progressColor ? StateColors.get(progressColor) : ap.iconColor
    }

    StateColorHandler {
        id: textColor
        stateColor: ap.textColor
    }
}
