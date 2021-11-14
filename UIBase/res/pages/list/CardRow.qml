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

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.Primary
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/01 primary"
        }

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.PrimaryWithoutShadow
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/02 primary without shadow"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.Secondary
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/03 secondary"
        }

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.Tertiary
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/04 tertiary"
        }
    }

    Column {
        width: childrenRect.width
        height: childrenRect.height

        spacing: Destiny.dp(8)

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.Black
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/05 black"
        }

        TalCard {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            style: TalCard.Style.White
        }

        TalText {
            width: Destiny.dp(320)
            height: Destiny.dp(32)
            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
            text: "04 card/05 white"
        }
    }

}
