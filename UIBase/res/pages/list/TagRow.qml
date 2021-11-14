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

        TalTag {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalTag.Style.Primary
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "07 tag/01 brand primary"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalTag {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalTag.Style.Secondary
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "07 tag/02 brand secondary"
        }
    }
    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalTag {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalTag.Style.Green
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "07 tag/03 green"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalTag {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalTag.Style.Red
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "07 tag/04 red"
        }
    }
}
