pragma Singleton
import QtQuick 2.0

Item {
    readonly property string family: "思源黑体 CN Regular"

    readonly property var body_18: Qt.font({
        family: family,
        pixelSize: 18
    })
    readonly property var body_24: Qt.font({
        family: family,
        pixelSize: 24
    })
    readonly property var body_28: Qt.font({
        family: family,
        pixelSize: 28
    })
    readonly property var body_40: Qt.font({
        family: family,
        pixelSize: 40
    })

    readonly property var head_30: Qt.font({
        family: family,
        pixelSize: 30,
        weight: Font.Bold
    })
}
