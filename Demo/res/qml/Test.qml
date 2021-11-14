import UIBase 1.0
import QtQuick 2.12

Item {

    width: 600
    height: 300

    property StateListColor color: StateListColors.blue_100_pressed_disabled

    Rectangle {
        anchors.fill: parent
        color: stateHandler.mapColor(parent.color).color
        TapHandler {
            onTapped: {
                Colors.dayNightMode = !Colors.dayNightMode
            }
        }

        StateHandler {
            id: stateHandler
        }
    }


    Component.onCompleted: {
        //color2 = StateListColors.blue_100_pressed_disabled
    }
}
