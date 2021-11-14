import QtQuick 2.0
import UIBase 1.0

Rectangle {

    enum Style {
        Primary, Secondary, Green, Red
    }

    property var style: ZTag.Style.Primary

    color: solidColor()
    border.color: borderColor()
    border.width: 1

    function borderColor() {
        if (style === ZTag.Style.Primary) {
            return "#5856D6"
        } else if (style === ZTag.Style.Secondary) {
            return "#FFC421"
        } else if (style === ZTag.Style.Green) {
            return "#07AA6E"
        } else if (style === ZTag.Style.Red) {
            return "#FF4D5B"
        }
        return "#00000000"
    }

    function solidColor() {
        if (style === ZTag.Style.Primary) {
            return "#0D5856D6"
        } else if (style === ZTag.Style.Secondary) {
            return "#0DFFC421"
        } else if (style === ZTag.Style.Green) {
            return "#0D07AA6E"
        } else if (style === ZTag.Style.Red) {
            return "#0DFF4D5B"
        }
        return "#00000000"
    }
}
