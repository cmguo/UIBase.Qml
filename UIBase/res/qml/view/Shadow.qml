import QtQuick 2.12
import QtGraphicalEffects 1.12

import TalUtils 1.0
import TalDisplay 1.0

Rectangle {

    property int shadowSamples: 24
    property int shadowVerticalOffset: 4
    property string shadowColor: "#50000000"


    radius: Destiny.dp(8)
    border.width: Destiny.dp(1)
    border.color: "#CDCDCD"

    layer.enabled: GraphicsInfo.api === GraphicsInfo.OpenGL
    layer.effect: DropShadow {
        color: shadowColor
        samples: shadowSamples
        verticalOffset: shadowVerticalOffset
    }

    Component.onCompleted: {
        console.log("GraphicsInfo.api: ", GraphicsInfo.api)
        console.log("GraphicsInfo.majorVersion: ", GraphicsInfo.majorVersion)
        console.log("GraphicsInfo.minorVersion: ", GraphicsInfo.minorVersion)
        console.log("GraphicsInfo.profile: ", GraphicsInfo.profile)
        console.log("GraphicsInfo.renderableType: ", GraphicsInfo.renderableType)
        console.log("GraphicsInfo.shaderCompilationType: ", GraphicsInfo.shaderCompilationType)
    }
}
