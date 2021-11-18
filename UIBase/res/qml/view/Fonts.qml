pragma Singleton
import QtQuick 2.0

Item {
    readonly property string fontFamily: "思源黑体 CN Regular"

    readonly property var body_18: Qt.font({
        family: fontFamily,
        pixelSize: 18
    })
    readonly property var body_24: Qt.font({
        family: fontFamily,
        pixelSize: 24
    })
    readonly property var body_28: Qt.font({
        family: fontFamily,
        pixelSize: 28
    })
    readonly property var body_40: Qt.font({
        family: fontFamily,
        pixelSize: 40
    })
}
