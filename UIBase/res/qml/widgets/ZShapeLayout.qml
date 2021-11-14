import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


import "./"

Rectangle {
    property string shapeSource: 'qrc:/uibase/drawable/tal_corner_shape_1.svg'
    property var privateRoot: this
    property Item shapeItem: Image {
        anchors.fill: privateRoot
        fillMode: Image.Stretch
        source: shapeSource
        smooth: true
    }
    layer.enabled: shapeSource == '' ? false : true
}
