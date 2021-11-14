import QtQuick 2.12
import QtQuick.Controls 2.5

import UIBase 1.0


Text {
    property bool singleLine: false
    property bool needShowTipElide: false

    id: taltext
    width: Math.min(implicitWidth,parent.width)
    height: implicitHeight
    property ZTextStyle talStyle: ZTextStyle { }
    font {
        family: talStyle.fontFamily();
        pixelSize: talStyle.fontPixelSize()
        bold: talStyle.fontBold
    }
    color: talStyle.fontColor()
    Keys.enabled: needShowTipElide
    opacity: talStyle.fontOpacity
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft
    wrapMode: singleLine ? Text.Normal : Text.WrapAnywhere
    elide: Text.ElideRight

    ZMouseArea {
        id: mouseArea
        anchors.fill: parent
        visible: needShowTipElide
    }
    ToolTip {
        ToolTip.timeout: 3000
        visible: mouseArea.state == mouseArea.stateHovered && needShowTipElide && taltext.truncated
        text: taltext.text
    }
}
