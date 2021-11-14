import QtQuick 2.0
import TalDisplay 1.0

import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Row {
    width: childrenRect.width
    height: childrenRect.height
    spacing: Destiny.dp(96)

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalTextField {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "09 input/01 normal"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalTextField {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            enabled: false
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "09 input/03 disabled"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height
        spacing: Destiny.dp(8)

        TalTextField {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            focus: true
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "09 input/05 focus"
        }
    }
}
