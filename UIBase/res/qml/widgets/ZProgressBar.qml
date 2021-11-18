import QtQuick 2.0
import QtQuick.Controls 2.0
import UIBase 1.0

ProgressBar {

    property string backgroundColor: "#CFCFCF"
    property string progressColor: "black"
    property double radius: 2

    id: control

    background: Rectangle {
        radius: radius
        color: backgroundColor
    }
    contentItem: Item {
        Rectangle {
            radius: radius
            color: progressColor
            width: control.visualPosition * parent.width
            height: parent.height
        }
    }
}
