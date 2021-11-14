import QtQuick 2.0

import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

ListModel {
    property bool isInited: false

    Component.onCompleted: {
        if (!isInited) {
            append({"name": "01 color/02 yellow/100", colorName: TalColor.colorYellow100 });
            append({"name": "01 color/02 yellow/300", colorName: TalColor.colorYellow300 });
            append({"name": "01 color/02 yellow/500", colorName: TalColor.colorYellow500 });
            append({"name": "01 color/02 yellow/700", colorName: TalColor.colorYellow700 });
            append({"name": "01 color/02 yellow/900", colorName: TalColor.colorYellow900 });

            append({"name": "01 color/02 orange/100", colorName: TalColor.colorOrange100 });
            append({"name": "01 color/02 orange/300", colorName: TalColor.colorOrange300 });
            append({"name": "01 color/02 orange/500", colorName: TalColor.colorOrange500 });
            append({"name": "01 color/02 orange/700", colorName: TalColor.colorOrange700 });
            append({"name": "01 color/02 orange/900", colorName: TalColor.colorOrange900 });

            append({"name": "01 color/02 red/100", colorName: TalColor.colorRed100 });
            append({"name": "01 color/02 red/300", colorName: TalColor.colorRed300 });
            append({"name": "01 color/02 red/500", colorName: TalColor.colorRed500 });
            append({"name": "01 color/02 red/700", colorName: TalColor.colorRed700 });
            append({"name": "01 color/02 red/900", colorName: TalColor.colorRed900 });
        }
        isInited = true
    }
}
