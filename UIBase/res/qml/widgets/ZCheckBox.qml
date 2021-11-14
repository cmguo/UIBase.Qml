import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import UIBase 1.0
import "./ZColor.js" as ZColors

CheckBox {
    id:control
    property int fontSize: 16
    property var color: "#2B2B2B"

    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitWidth: control.height
            implicitHeight: control.height
            radius: 4
            color: control.enabled ? (control.checked ? ZColors.colorConfigBrandPrimary : "#FFFFFF") : "#F8F8F8"
            border.color: !control.enabled ? "#121314" : control.checked ? ZColors.colorConfigBrandSecondary : "#8A8A8A"
            border.width: Destiny.dp(1)
            Image {
                width: parent.width * 4 / 5
                height: parent.height * 4 / 5
                anchors.centerIn: parent
                visible: control.checked
                source: "qrc:/uibase/drawable/uibase_checkbox_checked.svg"
                fillMode: Image.PreserveAspectCrop
            }

            Behavior on color {
                PropertyAnimation { duration: 300 }
            }
        }

        label:Text{
            font.pixelSize: control.fontSize
            font.family: "Microsoft Yahei"
            text: control.text
            color: control.color
        }

        function getColor() {
            if (control.enabled) {
                if (control.checked) {

                }
            }
        }
    }
}
