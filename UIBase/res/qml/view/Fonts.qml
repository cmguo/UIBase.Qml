pragma Singleton
import QtQuick 2.0

Item {
    readonly property string family: "HarmonyOS Sans SC"

    readonly property var body_16: Qt.font({
        family: family,
        pixelSize: 16
    })
    readonly property var body_18: Qt.font({
        family: family,
        pixelSize: 18
    })
    readonly property var body_20: Qt.font({
        family: family,
        pixelSize: 20
    })
    readonly property var body_24: Qt.font({
        family: family,
        pixelSize: 24
    })
    readonly property var body_28: Qt.font({
        family: family,
        pixelSize: 28
    })
    readonly property var body_30: Qt.font({
        family: family,
        pixelSize: 30
    })
    readonly property var body_32: Qt.font({
        family: family,
        pixelSize: 32
    })
    readonly property var body_36: Qt.font({
        family: family,
        pixelSize: 36
    })
    readonly property var body_38: Qt.font({
        family: family,
        pixelSize: 38
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
