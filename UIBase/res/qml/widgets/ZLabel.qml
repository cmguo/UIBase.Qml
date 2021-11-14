import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0
import "qrc:/uibase/qml/talwidget/ZConstant.js" as ZConstant


Label {
    property string backgroundColor: "transparent"

    width: implicitWidth
    height: implicitHeight

    padding: 0
    font.family: ZConstant.font

    background: Rectangle {
        color: backgroundColor
    }
}

