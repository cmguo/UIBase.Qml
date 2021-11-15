import QtQuick 2.0

Item {

    width: parent.width - navigator.width
    height: 40
    anchors.top: parent.top
    anchors.right: parent.right

    Rectangle {
        anchors.fill: parent
        color: "green"
    }

}
