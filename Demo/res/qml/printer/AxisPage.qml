import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml"

Item {

    anchors.fill: parent

    ZText {
        id: xyAxis
        height: 30
        x: 319
        font: Fonts.body_24
        text: "X/Y轴"
    }

    ZText {
        id: zAxis
        height: 30
        x: 709
        font: Fonts.body_24
        text: "Z轴"
    }

    ZText {
        id: eAxis
        height: 30
        x: 889
        font: Fonts.body_24
        text: "E轴"
    }

    Adjuster {
        id: yAdjuster
        width: 280
        height: 84
        anchors.top: xyAxis.bottom
        anchors.topMargin: 119
        anchors.horizontalCenter: xyAxis.horizontalCenter
        rotation: 90

        onAdjusted: {
            console.log(isLeft)
        }
    }

    Adjuster {
        id: xAdjuster
        width: yAdjuster.width
        height: yAdjuster.height
        anchors.top: yAdjuster.top
        anchors.left: yAdjuster.left

        onAdjusted: {
            console.log(isLeft)
        }
    }

    Adjuster {
        id: zAdjuster
        width: yAdjuster.width
        height: yAdjuster.height
        anchors.verticalCenter: yAdjuster.verticalCenter
        anchors.horizontalCenter: zAxis.horizontalCenter
        rotation: 90

        onAdjusted: {
            console.log(isLeft)
        }
    }

    Adjuster {
        id: eAdjuster
        width: yAdjuster.width
        height: yAdjuster.height
        anchors.verticalCenter: yAdjuster.verticalCenter
        anchors.horizontalCenter: eAxis.horizontalCenter
        rotation: 90

        onAdjusted: {
            console.log(isLeft)
        }
    }

    SelectBar {
        id: xyStep
        width: 467
        height: 95
        anchors.horizontalCenter: xyAxis.horizontalCenter
        anchors.top: xAdjuster.bottom
        anchors.topMargin: 152
        items: [0.1, 1, 10, 100]
        selectedItem: 1
    }

    SelectBar {
        id: zeStep
        width: 467
        height: 95
        anchors.left: xyStep.right
        anchors.leftMargin: 21
        anchors.top: xyStep.top
        items: [0.1, 1, 10, 100]
        selectedItem: 1
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("AxisPage.qml")
    }

}
