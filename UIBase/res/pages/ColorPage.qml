import QtQuick 2.0


import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0

Rectangle {

    anchors.fill: parent

    color: "transparent"

    TalText {
        text: "This is ColorPage.qml"
        color: "black"
        anchors.centerIn: parent
        font.pixelSize: Destiny.dp(30)
    }

}
