import QtQuick 2.0

import TalDisplay 1.0
import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Component {
    id: simpleColorDelegate

    Column {
        width: Destiny.dp(320)
        height: childrenRect.height
        spacing: Destiny.dp(8)

        Rectangle {
            id: itemColorRect
            width: parent.width
            height: Destiny.dp(32)
            color: colorName
        }

        TalText {
            id: itemNameText
            width: parent.width
            height: Destiny.dp(32)

            text: name
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; fontBold: false; }
        }
    }
}
