import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0


import "./"

Rectangle {
    property real margins : 0
    color: "transparent"
    anchors.top: parent.top
    anchors.topMargin: margins
    anchors.bottom: parent.bottom
    anchors.bottomMargin: margins
    anchors.left: parent.left
    anchors.leftMargin: margins
    anchors.right: parent.right
    anchors.rightMargin: margins
}
