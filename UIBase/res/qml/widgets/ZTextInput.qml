import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0
import "./"
import ZUtils 1.0

import "qrc:/uibase/qml/talwidget/ZConstant.js" as ZConstant

TextInput {

    font.pixelSize: Destiny.sp(16)
    font.family: ZConstant.font
    color: "#2B2B2B"

    clip: true

    property var textHint: ""
    property var colorHint: "#666666"

    // deal with text hint
    ZText {
        font.pixelSize: parent.font.pixelSize
        color: colorHint
        text: textHint
        visible: parent.text.length <= 0

        wrapMode: Text.Normal

    }

    property bool autoKeyboardShown: false

    ZHandler {
        id:handler
    }

    onFocusChanged: {
        if(focus) {
            ZUtils.showKeyBoard(true)
        }
    }
}
