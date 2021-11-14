import QtQuick 2.12
import QtGraphicalEffects 1.12
import UIBase 1.0


Rectangle {
    id: shadow

    property var horizontalShadowOffset: Destiny.dp(0)
    property var verticalShadowOffset: Destiny.dp(3)
    property var shadowSpace: Destiny.dp(14)

    property var contentWidth: childrenRect.width
    property var contentHeight: childrenRect.height

    width: contentWidth + shadowSpace * 2
    height: contentHeight + shadowSpace * 2
    color: "transparent"

    Rectangle {
        width: contentWidth
        height: contentHeight
        radius: Destiny.dp(6)
        color: "yellow"
        x: shadowSpace
        y: shadowSpace
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: horizontalShadowOffset
            verticalOffset: verticalShadowOffset
            color: "#50000000"
            radius: Destiny.dp(10)
            samples: radius * 2
        }
    }
}


