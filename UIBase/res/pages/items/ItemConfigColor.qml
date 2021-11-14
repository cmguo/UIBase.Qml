import QtQuick 2.0

import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

ListModel {
    property bool isInited: false

    Component.onCompleted: {
        if (!isInited) {
            append({"name": "02 config/01 brand primary", colorName: TalColor.colorConfigBrandPrimary });
            append({"name": "02 config/02 brand secondary", colorName: TalColor.colorConfigBrandSecondary });
            append({"name": "02 config/03 brand tertiary", colorName: TalColor.colorConfigBrandTertiary });
            append({"name": "02 config/03 red", colorName: TalColor.colorConfigRed });
            append({"name": "02 config/04 green", colorName: TalColor.colorConfigGreen });
            append({"name": "02 config/05 black", colorName: TalColor.colorConfigBlack });
            append({"name": "02 config/06 white", colorName: TalColor.colorConfigWhite });
        }
        isInited = true
    }
}
