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
        talStyle: buttonPrimaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "01 primary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonPrimaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "01 primary/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonPrimaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "01 primary/03 disable"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonPrimaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "01 primary/04 hover"
    }

    //////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostPrimaryNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "04 ghost primary/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostPrimaryPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "04 ghost primary/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostPrimaryDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "04 ghost primary/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonGhostPrimaryHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "04 ghost primary/04 hover"
    }

    //////////////////////////////////////////////////////////

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonErrorNormal
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "07 error/01 normal"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonErrorPressed
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "07 error/02 pressed"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonErrorDisable
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "07 error/03 disabled"
    }

    TalShape {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: buttonErrorHover
    }

    TalText {
        width: Destiny.dp(400)
        height: Destiny.dp(32)
        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
        text: "07 error/04 hover"
    }



}
