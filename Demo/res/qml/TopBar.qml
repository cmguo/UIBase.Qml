import QtQuick 2.0

Item {

    width: parent.width - navigator.width
    height: 49
    anchors.top: parent.top
    anchors.right: parent.right

    ListView {
        anchors.fill: parent
    }

}
