import QtQuick 2.0

import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

ListModel {
    property bool isInited: false

    Component.onCompleted: {
        if (!isInited) {
            append({name: "01 color/02 green/100", colorName: TalColor.colorGreen100 });
            append({name: "01 color/02 green/300", colorName: TalColor.colorGreen300 });
            append({name: "01 color/02 green/500", colorName: TalColor.colorGreen500 });
            append({name: "01 color/02 green/700", colorName: TalColor.colorGreen700 });
            append({name: "01 color/02 green/900", colorName: TalColor.colorGreen900 });

            append({name: "01 color/02 navy blue/100", colorName: TalColor.colorNavyBlue100 });
            append({name: "01 color/02 navy blue/300", colorName: TalColor.colorNavyBlue300 });
            append({name: "01 color/02 navy blue/500", colorName: TalColor.colorNavyBlue500 });
            append({name: "01 color/02 navy blue/700", colorName: TalColor.colorNavyBlue700 });
            append({name: "01 color/02 navy blue/900", colorName: TalColor.colorNavyBlue900 });

            append({name: "01 color/02 cobalt blue/100", colorName: TalColor.colorCobaltBlue100 });
            append({name: "01 color/02 cobalt blue/300", colorName: TalColor.colorCobaltBlue300 });
            append({name: "01 color/02 cobalt blue/500", colorName: TalColor.colorCobaltBlue500 });
            append({name: "01 color/02 cobalt blue/700", colorName: TalColor.colorCobaltBlue700 });
            append({name: "01 color/02 cobalt blue/900", colorName: TalColor.colorCobaltBlue900 });

            append({name: "01 color/02 purple/100", colorName: TalColor.colorPurple100 });
            append({name: "01 color/02 purple/300", colorName: TalColor.colorPurple300 });
            append({name: "01 color/02 purple/500", colorName: TalColor.colorPurple500 });
            append({name: "01 color/02 purple/700", colorName: TalColor.colorPurple700 });
            append({name: "01 color/02 purple/900", colorName: TalColor.colorPurple900 });

        }
        isInited = true
    }
}
