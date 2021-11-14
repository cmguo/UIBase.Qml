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
        talStyle: buttonTertiaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "03 tertiary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonTertiaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "03 tertiary/02 Pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonTertiaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "03 tertiary/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonTertiaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "03 tertiary/04 hover"
    }

    ////////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostTertiaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "06 ghost tertiary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostTertiaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "06 ghost tertiary/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostTertiaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "06 ghost tertiary/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostTertiaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "06 ghost tertiary/04 hover"
    }

    ////////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonWarnNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "09 warning/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonWarnPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "09 warning/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonWarnDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "09 warning/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonWarnHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "09 warning/04 hover"
    }
}
