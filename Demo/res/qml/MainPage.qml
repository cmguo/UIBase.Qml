import QtQuick 2.0

Item {

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "#234567"

        Text {
            id: desc
            anchors.centerIn: parent
            font.pointSize: 40
            text: qsTr("MainPage.qml")
        }
    }
}
