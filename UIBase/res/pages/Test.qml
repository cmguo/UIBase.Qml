import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import TalDisplay 1.0

import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Rectangle {
    id: content
//    anchors.fill: parent

    property bool tmp: false

    readonly property bool isshown: {
        return tmp
    }

    TopBar {
        id: topBar
        text: "测试"
    }

    TextField {
        id: textField
        width: Destiny.dp(320)
        height: Destiny.dp(32)
        enabled: isshown

        anchors { top: topBar.bottom; topMargin: 24 }

        placeholderText: "用户名"
        style: TextFieldStyle {
            background: Rectangle {
                color: getColor()
                border.width: 1
                border.color: getBorderColor()
            }

            function getBorderColor() {
                if (! textField.enabled) {
                    return "#00000000";
                } else if (textField.focus || textField.hovered) {
                    return "#008FFF";
                }
                return "#E2E3E4";
            }

            function getColor() {
                if (! textField.enabled) {
                    return "#4DEFEFEF";
                } else if (textField.focus || textField.hovered) {
                    return "#EFEFEF";
                }
                return "#EFEFEF";
            }
        }
    }

    TextField {
        id: textField1
        width: Destiny.dp(320)
        height: Destiny.dp(32)
        enabled: isshown

        anchors { top: textField.bottom; topMargin: 24 }

        placeholderText: "用户名"
        style: TextFieldStyle {
            background: Rectangle {
                color: getColor()
                border.width: 1
                border.color: getBorderColor()
            }

            function getBorderColor() {
                if (! textField1.enabled) {
                    return "#00000000";
                } else if (textField1.focus || textField1.hovered) {
                    return "#008FFF";
                }
                return "#E2E3E4";
            }

            function getColor() {
                if (! textField1.enabled) {
                    return "#4DEFEFEF";
                } else if (textField1.focus || textField1.hovered) {
                    return "#EFEFEF";
                }
                return "#EFEFEF";
            }
        }
    }

    Button {

        anchors.horizontalCenter: parent.horizontalCenter
        text: "测试"
        onClicked:  {
            tmp = !tmp
        }
    }

    TextArea {
        width: Destiny.dp(320)
        height: Destiny.dp(320)

        anchors { top: textField1.bottom; topMargin: 24 }
    }

    Component.onCompleted: {
        console.log("width: " + content.width + "; height: " + content.height)
    }

}
