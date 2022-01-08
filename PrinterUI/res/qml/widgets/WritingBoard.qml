import QtQuick 2.12
import QtQuick.Shapes 1.12

Item {

    MouseArea {
        property real lx;
        property real ly;

        anchors.fill: parent

        onPressed: {
            lx = mouse.x
            ly = mouse.y
            shape.start(lx, ly)
        }

        onPositionChanged: {
            if (Math.abs(mouse.x - lx) + Math.abs(mouse.y - ly) > 10) {
                lx = mouse.x;
                ly = mouse.y;
                shape.line(lx, ly)
            }
        }
    }

    Shape {
        id: shape

        anchors.fill: parent
        ShapePath {
            id: path
            strokeWidth: 4
            strokeColor: "red"
            fillColor: "transparent"
        }

        function start(x, y) {
            var elems = path.pathElements
            var move = moveComp.createObject(path)
            move.x = x
            move.y = y
            elems.push(move)
        }

        function line(x, y) {
            var elems = path.pathElements
            var line = lineComp.createObject(path)
            line.x = x
            line.y = y
            elems.push(line)
        }
    }

    Component {
        id: lineComp
        PathLine {}
    }

    Component {
        id: moveComp
        PathMove {}
    }
}
