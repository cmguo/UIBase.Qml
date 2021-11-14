import QtQuick 2.0
import TalDisplay 1.0

import "../../style"
import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"
Column {
    width: childrenRect.width
    height: childrenRect.height

    spacing: 10

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSecondaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "02 secondary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSecondaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "02 secondary/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSecondaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "02 secondary/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSecondaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "02 secondary/04 hover"
    }

    ////////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostSecondaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "05 ghost secondary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostSecondaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "05 ghost secondary/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostSecondaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "05 ghost secondary/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostSecondaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "05 ghost secondary/04 hover"
    }

    ////////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSuccessNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "08 success/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSuccessPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "08 success/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSuccessDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "08 success/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonSuccessHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "08 success/04 hover"
    }
}
