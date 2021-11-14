import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
    enum Shape {
        Primary, Secondary, Navigation, TimerCounting, TimerFinish
    }

    property var shape: ZShape.Shape.Primary

    color: getColor()
    border.width: 1
    border.color: getBorderColor()

    function getColor() {
        if (shape === ZShape.Shape.Primary) {
            return "#FAFAFA";
        } else if (shape === ZShape.Shape.Secondary) {
            return "#E2E3E4";
        } else if (shape === ZShape.Shape.TimerCounting) {
            return "#66A6EE";
        } else if (shape === ZShape.Shape.TimerFinish) {
            return "#64C3AD";
        } else if (shape === ZShape.Shape.Navigation) {
            return "#FAFAFA";
        }
        return "#00000000";
    }

    function getBorderColor() {
        if (shape === ZShape.Shape.Primary) {
            return "#E2E3E4";
        } else if (shape === ZShape.Shape.Secondary) {
            return "#A5B0BB";
        } else if (shape === ZShape.Shape.TimerCounting) {
            return "#368BD4";
        } else if (shape === ZShape.Shape.TimerFinish) {
            return "#3AAD9A";
        } else if (shape === ZShape.Shape.Navigation) {
            return "#E2E3E4";
        }
        return "#00000000";
    }

}
