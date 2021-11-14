import QtQuick 2.0
import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0
import "./"


TalButtonStyle {
    loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

    color:  "#00000000"
    colorHovered: "#00000000"
    colorPressed: "#00000000"

    textColor: "#2B2B2B"
    textColorHovered: "#C72B2B2B"
    textColorPressed: "#2B2B2B"

    borderColor: "#00000000"
    borderColorHovered:  "#00000000"
    borderColorPressed:  "#00000000"

    radius: 0

    fontPixelSize: Destiny.sp(16)
}
