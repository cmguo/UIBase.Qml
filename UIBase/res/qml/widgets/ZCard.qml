import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {

    enum Style {
        Primary, PrimaryWithoutShadow, Secondary, Tertiary, Black, White
    }

    property var style: ZCard.Style.Primary

    Rectangle {
        id: shadowContainer
        width: parent.width
        height: parent.height

        color: solidColor()
        border.width: borderWidth()
        border.color: borderColor()
    }

    DropShadow {
        anchors.fill: shadowContainer
        horizontalOffset: 2
        verticalOffset: 2
        radius: 8
        samples: 17
        color: shadowColor()
        source: shadowContainer
    }

    function solidColor() {
        if (style === ZCard.Style.Primary) {
            return "#FAFAFA";
        } else if (style === ZCard.Style.PrimaryWithoutShadow) {
            return "#FAFAFA";
        } else if (style === ZCard.Style.Secondary) {
            return "#F4F4F4";
        } else if (style === ZCard.Style.Tertiary) {
            return "#FAFAFA";
        } else if (style === ZCard.Style.Black) {
            return "#2B3034";
        } else if (style === ZCard.Style.White) {
            return "#FFFFFF";
        }
        return "#00000000";
    }

    function borderWidth() {
        if (style === ZCard.Style.Primary) {
            return 1;
        } else if (style === ZCard.Style.PrimaryWithoutShadow) {
            return 1;
        } else if (style === ZCard.Style.Secondary) {
            return 0;
        } else if (style === ZCard.Style.Tertiary) {
            return 0;
        } else if (style === ZCard.Style.Black) {
            return 1;
        } else if (style === ZCard.Style.White) {
            return 0;
        }
        return 0;
    }

    function borderColor() {
        if (style === ZCard.Style.Primary) {
            return "#E2E3E4";
        } else if (style === ZCard.Style.PrimaryWithoutShadow) {
            return "#E2E3E4";
        } else if (style === ZCard.Style.Secondary) {
            return "#00000000";
        } else if (style === ZCard.Style.Tertiary) {
            return "#00000000";
        } else if (style === ZCard.Style.Black) {
            return "#82000000";
        } else if (style === ZCard.Style.White) {
            return "#29000000";
        }
        return "#00000000";
    }

    function shadowOffset() {
        if (style === ZCard.Style.Primary) {
            return 2;
        } else if (style === ZCard.Style.PrimaryWithoutShadow) {
            return 0;
        } else if (style === ZCard.Style.Secondary) {
            return 4;
        } else if (style === ZCard.Style.Tertiary) {
            return 0;
        } else if (style === ZCard.Style.Black) {
            return 2;
        } else if (style === ZCard.Style.White) {
            return 2;
        }
        return 0;
    }

    function shadowColor() {
        if (style === ZCard.Style.Primary) {
            return "#29000000";
        } else if (style === ZCard.Style.PrimaryWithoutShadow) {
            return "#00000000";
        } else if (style === ZCard.Style.Secondary) {
            return "#801E264E";
        } else if (style === ZCard.Style.Tertiary) {
            return "#0D2A2C2E";
        } else if (style === ZCard.Style.Black) {
            return "#82000000";
        } else if (style === ZCard.Style.White) {
            return "#29000000";
        }
        return "#00000000";
    }
}
