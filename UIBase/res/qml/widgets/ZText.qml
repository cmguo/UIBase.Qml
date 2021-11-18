import QtQuick 2.12
import QtQuick.Controls 2.5

import UIBase 1.0


Text {
    property bool singleLine: false
    property bool showTipElide: false

    font: Fonts.body_24
    color: "#2C2C2E"
    verticalAlignment: Text.AlignVCenter
    wrapMode: singleLine ? Text.Normal : Text.WrapAnywhere
    elide: Text.ElideRight

    HoverHandler {
        id: hoverHandler
        enabled: showTipElide
    }

    ToolTip {
        timeout: 3000
        visible: hoverHandler.hovered && showTipElide && taltext.truncated
        text: parent.text
    }
}
