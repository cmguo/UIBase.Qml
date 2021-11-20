import QtQuick 2.12
import QtQuick.Shapes 1.12

QtObject {

    Component.onCompleted: {
        topBar.add("wifi", wifi)
    }

    property var wifi: Component {
        Item {
            property int strength: 2
            width: 25
            height: 20

            Repeater {
                model: 4
                delegate: Shape {
                    ShapePath {
                        strokeColor: index <= strength ? "#1C1C1E" : "transparent"
                        strokeWidth: index == 0 ? 1.5 : 2
                        fillColor: "transparent"
                        PathAngleArc {
                            centerX: 13
                            centerY: 17
                            radiusX: index * 4 + 1
                            radiusY: radiusX
                            startAngle: index == 0 ? 0 : -45
                            sweepAngle: index == 0 ? 360 : -90
                        }
                    }
                }
            }
        }
    }
}
