import QtQuick 2.12
import QtGraphicalEffects 1.12
import UIBase 1.0

Item {

    id: navigator

    property string activePage
    property alias pages: list.model

    DropShadow {
        anchors.fill: content
        horizontalOffset: 3
        verticalOffset: 3
        radius: 15
        samples: 31
        cached: true
        color: "#40000000"
        source: content
    }

    Rectangle {
        id: content
        anchors.fill: parent
        color: "#3B3C40"

        ListView {
            id: list
            anchors.fill: parent
            delegate: navItem
        }

        Component {
            id: navItem

            Item {
                width: parent.width
                height: list.height / 5

                ZButton {
                    width: parent.width
                    height: 112
                    anchors.centerIn: parent
                    property bool checked: name == activePage
                    backgroundColor: StateColor {
                        StateColorItem { color: "graybg"; states: StateColor.Pressed }
                        StateColorItem { color: "graybg"; states: StateColor.Checked }
                        StateColorItem { color: "transparent"; states: StateColor.Normal }
                    }
                    cornerRadius: 0
                    icon: "../icon/" + model.icon
                    iconSize: 52

                    onClicked: {
                        navigator.activePage = name
                    }

                    Rectangle {
                        width: 9
                        height: parent.height
                        anchors.right: parent.right
                        color: borderColor.color
                    }

                    StateColorHandler {
                        id: borderColor
                        stateColor: StateColors.get("transparent_checked_pressed2")
                    }

                }
            }

        }

    }

}
