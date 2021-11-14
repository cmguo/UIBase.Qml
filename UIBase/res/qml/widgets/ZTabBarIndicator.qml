import QtQuick 2.0
import "./"
import UIBase 1.0

Rectangle {
    property var animDuration: 200
    width: parent.currentItem.width
    height: Destiny.dp(4)
    color: "#2B2B2B"
    x: {
        parent.currentItem.x
    }

    Behavior on x {
        PropertyAnimation {
            duration: animDuration
        }
    }
    Behavior on width {
        PropertyAnimation {
            duration: animDuration
        }
    }
}
