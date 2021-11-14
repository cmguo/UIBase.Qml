import QtQuick 2.0
import TalDisplay 1.0

import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Component {
    Rectangle {
        id: container
        width: imageRect.width
        height: imageRect.height
        property bool isIcon: false

        Rectangle {
            id: imageRect
            width: Destiny.dp(size + 2)
            height: Destiny.dp(size + 2)

            border.color: "gray"
            border.width: size < 25 ? 0 : Destiny.dp(1)
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: itemImage
                width: Destiny.dp(size)
                height: Destiny.dp(size)
                anchors.horizontalCenter: parent.horizontalCenter
                source: name
                visible: !container.isIcon
            }
            TalIcon {
                id: itemIcon
                width: Destiny.dp(size)
                height: Destiny.dp(size)
                visible: container.isIcon
                source: name
                tintColor: "red"
            }
        }
    }
}
