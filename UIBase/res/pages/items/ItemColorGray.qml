import QtQuick 2.0

import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

ListModel {
    property bool isInited: false

    Component.onCompleted: {
        if (!isInited) {
            append({"name": "01 color/01 gray/100", colorName: TalColor.colorGray100 });
            append({"name": "01 color/01 gray/200", colorName: TalColor.colorGray200 });
            append({"name": "01 color/01 gray/300", colorName: TalColor.colorGray300 });
            append({"name": "01 color/01 gray/400", colorName: TalColor.colorGray400 });
            append({"name": "01 color/01 gray/500", colorName: TalColor.colorGray500 });
            append({"name": "01 color/01 gray/600", colorName: TalColor.colorGray600 });
            append({"name": "01 color/01 gray/700", colorName: TalColor.colorGray700 });
            append({"name": "01 color/01 gray/800", colorName: TalColor.colorGray800 });
            append({"name": "01 color/01 gray/900", colorName: TalColor.colorGray900 });
        }
        isInited = true
    }
}
