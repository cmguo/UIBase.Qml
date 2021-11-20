import UIBase 1.0
import QtQuick 2.12

Item {

    width: 1280
    height: 720

    property StateListColor statelistcolor: StateListColors.get("blue_100_pressed_disabled")
    property int size2: ZButtonAppearance.Small

    Rectangle {
        anchors.fill: parent
        color: "white" // backgroundColor.color
        //TapHandler {
        //    onTapped: {
                //Colors.dayNightMode = !Colors.dayNightMode
        //    }
        //}

        StateColor {
            id: backgroundColor
            colors: statelistcolor
        }

        ZButton {
            id: primitive
            type: ZButtonAppearance.Primitive
            size: size2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "Button 1"
            onClicked: {
                size2 = ZButtonAppearance.Large
            }
        }

        ZButton {
            id: secondary
            type: ZButtonAppearance.Secondary
            size: size2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 200
            text: "Button 2"
            onClicked: {
                size2 = ZButtonAppearance.Middle
            }
        }

        ZButton {
            id: tertiary
            type: ZButtonAppearance.Tertiary
            size: size2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            text: "Button 3"
            onClicked: {
                size2 = ZButtonAppearance.Small
            }
        }

        ZButton {
            id: danger
            type: ZButtonAppearance.Danger
            size: size2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 400
            text: "Button 4"
            onClicked: {
                size2 = ZButtonAppearance.Thin
            }
        }

        ZButton {
            id: textLink
            type: ZButtonAppearance.TextLink
            size: size2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 500
            text: "Button 5"
        }
    }

    Component.onCompleted: {
        //color2 = StateListColors.blue_100_pressed_disabled
    }
}
