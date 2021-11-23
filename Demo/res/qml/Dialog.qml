import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"


Rectangle {

    property url url
    property var args: ({})
    signal buttonClicked(int index, string title)

    id: dialog
    color: "#4D000000"

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: false
        onPressed: {
            mouse.accepted = true
        }
    }

    Rectangle {
        width: 128 + content.width + 128
        height: 102 + content.height + 180
        anchors.centerIn: parent
        radius: 15
        color: Colors.lightbg2

        ZText {
            x: 102
            y: 64
            font: Fonts.head_30
            text: content.item.title
        }

        Loader {
            id: content
            x: 102
            y: 128
        }

        Timer {
            // post execute
            id: timer
            interval: 0
            repeat: false
            onTriggered: {
                dialog.parent.clear()
            }
        }

        ListView {
            id: btnList
            height: 60
            width: contentWidth
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            orientation: Qt.Horizontal
            spacing: 37
            model: content.item.buttons
            delegate: ZButton {
                height: 60
                text: modelData
                property int index2: index
                property bool checked: index === content.item.defaultButton
                onClicked: {
                    content.item.buttonClicked(index2)
                    buttonClicked(index2, text)
                    timer.start();
                }
            }
        }

        Component.onCompleted: {
            content.setSource(dialog.url, dialog.args)
        }

    }

}
