import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TextField {
    id: textField

    property int duration: 300

    style: TextFieldStyle {
        background: Rectangle {
            color: getColor()
            border.width: 1
            border.color: getBorderColor()

            Behavior on color {
                PropertyAnimation { duration: duration }
            }
            Behavior on border.color {
                PropertyAnimation { duration: duration }
            }
        }

        function getBorderColor() {
            if (! textField.enabled) {
                return "#E2E3E4";
            } else if (textField.focus || textField.hovered) {
                return "#008FFF";
            }
            return "#E2E3E4";
        }

        function getColor() {
            if (! textField.enabled) {
                return "#EEEEEE";
            } else if (textField.focus || textField.hovered) {
                return "#F8F8F8";
            }
            return "#F8F8F8";
        }
    }
}
