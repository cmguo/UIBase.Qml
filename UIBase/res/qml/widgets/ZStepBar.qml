import QtQuick 2.12
import QtQuick.Shapes 1.12
import UIBase 1.0

Item {

    enum Orientation {
        Horizontal,
        Vertical
    }

    required property var steps
    property int step: 0

    property real barWidth: 24
    property real stepOffset: 87 // (bar.height - bar.width) / steps.count
    property var orientation: ZStepBar.Vertical

    property string backgroundColor: "#C4C4C4"
    property string stepColor: "black"
    property string numberColor: "white"
    property string titleColor: "#929292"
    property var numberFont: Fonts.body_18
    property var titleFont: Fonts.body_20


    id: control

    Item {
        id: bar
        rotation: orientation === ZStepBar.Vertical ? 0 : 90
        transformOrigin: { x: barWidth / 2; y: barWidth / 2 }

        Shape {
            ZStepIndicator {
                id: path1
                width: barWidth
                height: stepOffset
                count: repeater.count - 1
                color: backgroundColor
            }

            Component.onCompleted: {
                data.push(path1.path)
            }

        }

        Shape {
            anchors.fill: parent

            ZStepIndicator {
                id: path2
                width: barWidth
                height: stepOffset
                count: step
                color: stepColor
            }

            Component.onCompleted: {
                data.push(path2.path)
            }

        }
    }


    Repeater {
        id: repeater
        model: steps
        delegate: Item {
            width: 0
            height: 0
            x: orientation === ZStepBar.Vertical ? barWidth / 2 : barWidth / 2 + index * stepOffset
            y: orientation === ZStepBar.Vertical ? barWidth / 2 + index * stepOffset : barWidth / 2
            ZText {
                id: number
                anchors.centerIn: parent
                font: numberFont
                color: numberColor
                text: index + 1
            }
            ZText {
                id: title
                x: orientation === ZStepBar.Vertical ? 30 : width / -0.5
                y: orientation === ZStepBar.Vertical ? height * -0.5 : 30
                font: titleFont
                color: titleColor
                text: modelData
            }
        }
    }

}
