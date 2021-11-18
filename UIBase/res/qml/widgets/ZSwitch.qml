import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0

Switch {
    id: control

    indicator: Rectangle {
        implicitWidth: 53
        implicitHeight: 24
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        color: control.checked ? Colors.brand : Colors.font1

        Rectangle {
            width: height
            height: parent.height - 4
            x: control.checked ? parent.width - width - 2 : 2
            anchors.verticalCenter: parent.verticalCenter
            radius: 13
            color: control.down ? "#cccccc" : "#F3F3F3"
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
