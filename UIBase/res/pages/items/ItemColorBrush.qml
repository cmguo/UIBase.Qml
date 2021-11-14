import QtQuick 2.0

import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

ListModel {
    property bool isInited: false

    Component.onCompleted: {
        append({ name: "10 brush color palette/01 white", colorName: TalColor.colorBrushWhite })
        append({ name: "10 brush color palette/02 yellow", colorName: TalColor.colorBrushYellow })
        append({ name: "10 brush color palette/03 orange", colorName: TalColor.colorBrushOrange })
        append({ name: "10 brush color palette/04 red", colorName: TalColor.colorBrushRed })
        append({ name: "10 brush color palette/05 purple", colorName: TalColor.colorBrushPurple })
        append({ name: "10 brush color palette/06 navy blue", colorName: TalColor.colorBrushNavyBlue })
        append({ name: "10 brush color palette/07 aqua blue", colorName: TalColor.colorBrushAquaBlue })
        append({ name: "10 brush color palette/08 cobalt blue", colorName: TalColor.colorBrushCobaltBlue })
        append({ name: "10 brush color palette/09 dark blue", colorName: TalColor.colorBrushDarkBlue })
        append({ name: "10 brush color palette/10 black", colorName: TalColor.colorBrushBlack })
    }
}
