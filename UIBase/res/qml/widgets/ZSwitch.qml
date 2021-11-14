import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0
import "./"
import "qrc:/uibase/qml/talwidget/ZColor.js" as ZColor

Rectangle {
    property bool checked: false
    property bool checkable: true
    property var animDuration: 200

    function toggle() {
        checked = !checked
    }

    width: Destiny.dp(56)
    height: Destiny.dp(33.5)
    radius: height/2
    color: !checked ? "#B0B1B4" :  ZColor.colorPurple900
    enabled: checkable
    Behavior on color {
        PropertyAnimation { duration: animDuration}
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(checkable) {
                toggle()
            }
        }
    }

    Rectangle {
        property var padding: Destiny.dp(1)
        id: ball
        color: white
        height: parent.height - padding * 2
        width: height
        radius: height/2
        x: !checked ? padding : parent.width - width - padding
        y: padding

        Behavior on x {
            PropertyAnimation { duration: animDuration}
        }
    }


}
