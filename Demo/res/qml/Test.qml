import UIBase 1.0
import QtQuick 2.12
import "qrc:/uibase/qml/widgets"

Item {

    width: 1280
    height: 720

    property StateListColor statelistcolor: StateListColors.get("blue_100_pressed_disabled")
    property int buttonSize2: ZButtonAppearance.Small

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
            buttonType: ZButtonAppearance.Primitive
            buttonSize: buttonSize2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "Button 1"
            onClicked: {
                buttonSize2 = ZButtonAppearance.Large
            }
        }

        ZButton {
            id: secondary
            buttonType: ZButtonAppearance.Secondary
            buttonSize: buttonSize2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 200
            text: "Button 2"
            onClicked: {
                buttonSize2 = ZButtonAppearance.Middle
            }
        }

        ZButton {
            id: tertiary
            buttonType: ZButtonAppearance.Tertiary
            buttonSize: buttonSize2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            text: "Button 3"
            onClicked: {
                buttonSize2 = ZButtonAppearance.Small
            }
        }

        ZButton {
            id: danger
            buttonType: ZButtonAppearance.Danger
            buttonSize: buttonSize2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 400
            text: "Button 4"
            onClicked: {
                buttonSize2 = ZButtonAppearance.Thin
            }
        }

        ZButton {
            id: textLink
            buttonType: ZButtonAppearance.TextLink
            buttonSize: buttonSize2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 500
            text: "Button 5"
        }
    }

    Component.onCompleted: {
        //color2 = StateListColors.blue_100_pressed_disabled
    }
}
