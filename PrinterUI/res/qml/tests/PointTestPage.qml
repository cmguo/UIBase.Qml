import QtQuick 2.12
import QtQuick.Shapes 1.12
import "../widgets"

Item {

    property real cornerOffset: 50
    property real cornerRadius: 25

    id: page

    Repeater {
        id: repeater
        model: [
            Qt.point(cornerOffset, cornerOffset),
            Qt.point(page.width - cornerOffset * 2, cornerOffset),
            Qt.point(page.width - cornerOffset * 2, page.height - cornerOffset * 2),
            Qt.point(cornerOffset, page.height - cornerOffset * 2),
        ]

        delegate: Shape {
            ShapePath {
                strokeColor: "black"
                strokeWidth: 4
                fillColor: "transparent"

                PathAngleArc {
                    centerX: modelData.x
                    centerY: modelData.y
                    radiusX: cornerRadius
                    radiusY: cornerRadius
                    startAngle: 0
                    sweepAngle: 360
                }

                PathMove {
                    x: modelData.x
                    y: modelData.y
                }

                PathLine {
                    property var next: repeater.model[(index + 1) % 4]
                    x: next.x
                    y: next.y
                }

                PathMove {
                    x: modelData.x
                    y: modelData.y
                }

                PathLine {
                    property var next2: repeater.model[(index + 2) % 4]
                    x: next2.x
                    y: next2.y
                }

            }
        }
    }

    WritingBoard {
        anchors.fill: parent
    }

}
