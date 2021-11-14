import QtQuick 2.0
import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0
import "./"


TalButtonStyle {

    loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"

    color:  "#00FFFFFF"
    colorHovered: "#0AFFFFFF"
    colorPressed: "#00FFFFFF"

    textColor: "#2B2B2B"
    textColorHovered: "#2B2B2B"
    textColorPressed: "#2B2B2B"

    borderColor: "#DCDDDF"
    borderColorHovered:  "#ABABAB"
    borderColorPressed:  "#ABABAB"

    iconLeft: "qrc:/uibase/drawable/uibase_icon_close.png"
}
