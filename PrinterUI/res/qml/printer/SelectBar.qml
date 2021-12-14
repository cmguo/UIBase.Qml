import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var items
    property var selectedItem: items[selectedIndex]
    property var selectedIndex

    Rectangle {
        anchors.fill: parent
        radius: 15
        color: Colors.lightbg2

        ListView {
            id: list
            anchors.fill: parent
            anchors.margins: 10
            orientation: ListView.Horizontal
            model: items
            delegate: Item {
                width: list.width / list.count
                height: list.height
                ZButton {
                    width: parent.width - 10
                    anchors.centerIn: parent
                    type: ZButtonAppearance.Primitive
                    textSize: 30
                    property bool checked: selectedItem === modelData
                    text: modelData
                    onClicked: {
                        selectedIndex = index
                    }
                }
            }
        }
    }

}
