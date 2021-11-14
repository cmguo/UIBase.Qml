import QtQuick 2.0

QtObject {
    property var textColor: "#2B2B2B"
    property var textColorHovered: "#2B2B2B"
    property var textColorPressed: "#2B2B2B"
    property var textColorDisabled: textColor

    property var fontFamily: "Microsoft YaHei"
    property int fontPixelSize: getFontPixelSize(size)
    property var fontBold: false
    property var fontItalic: false

    property var indicatorColor: "#686E72"
    property var indicatorColorHovered: "#686E72"
    property var indicatorColorPressed: "#686E72"
    property var indicatorColorDisabled: indicatorColor

    property var indicatorAlign: Qt.AlignBottom
}
