import QtQuick 2.0
import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0

QtObject {

    property int largeWidth: Destiny.dp(256)
    property int largeHeight: Destiny.dp(64)
    property int largeFontPixelSize: Destiny.dp(18)

    property int mediumWidth: Destiny.dp(180)
    property int mediumHeight: Destiny.dp(48)
    property int mediumFontPixelSize: Destiny.dp(16)

    property int smallWidth: Destiny.dp(84)
    property int smallHeight: Destiny.dp(40)
    property int smallFontPixelSize: Destiny.dp(16)

    property TalButtonStyle primaryLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#008FFF"
        colorHovered: "#1799FF"
        colorPressed: "#0065B4"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle primaryMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#008FFF"
        colorHovered: "#1799FF"
        colorPressed: "#0065B4"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }


    property TalButtonStyle primarySmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#008FFF"
        colorHovered: "#1799FF"
        colorPressed: "#0065B4"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }


    property TalButtonStyle secondaryLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize


        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"



        color:  "#E9EAEE"
        colorHovered: "#DFDFDF"
        colorPressed: "#C2C2C2"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"


    }

    property TalButtonStyle secondaryMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"


        color:  "#E9EAEE"
        colorHovered: "#DFDFDF"
        colorPressed: "#C2C2C2"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle secondarySmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"


        color:  "#E9EAEE"
        colorHovered: "#DFDFDF"
        colorPressed: "#C2C2C2"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }

    property TalButtonStyle secondaryGoastLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"


        color:  "#00000000"
        colorHovered: "#444E55"
        colorPressed: "#31393E"

        textColor: "#2B2B2B"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#444E55"
        borderColorHovered:  "#00444E55"
        borderColorPressed:  "#00444E55"

    }


    property TalButtonStyle secondaryGoastMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"


        color:  "#00000000"
        colorHovered: "#444E55"
        colorPressed: "#31393E"

        textColor: "#2B2B2B"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#444E55"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle secondaryGoastSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"


        color:  "#00000000"
        colorHovered: "#444E55"
        colorPressed: "#31393E"

        textColor: "#2B2B2B"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#444E55"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }


    property TalButtonStyle primaryGoastLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#00FFFFFF"
        colorHovered: "#15FFFFFF"
        colorPressed: "#31FFFFFF"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#FFFFFFFF"
        borderColorHovered:  "#FFFFFFFF"
        borderColorPressed:  "#FFFFFFFF"

    }


    property TalButtonStyle primaryGoastMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#00FFFFFF"
        colorHovered: "#15FFFFFF"
        colorPressed: "#31FFFFFF"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#FFFFFFFF"
        borderColorHovered:  "#FFFFFFFF"
        borderColorPressed:  "#FFFFFFFF"

    }


    property TalButtonStyle primaryGoastSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#00FFFFFF"
        colorHovered: "#15FFFFFF"
        colorPressed: "#31FFFFFF"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#FFFFFFFF"
        borderColorHovered:  "#FFFFFFFF"
        borderColorPressed:  "#FFFFFFFF"

    }



    property TalButtonStyle tertiaryLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#31F5F7FB"
        colorHovered: "#79FFFFFF"
        colorPressed: "#79EFF0F3"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle tertiaryMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#31F5F7FB"
        colorHovered: "#79FFFFFF"
        colorPressed: "#79EFF0F3"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle tertiarySmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize


        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#31F5F7FB"
        colorHovered: "#79FFFFFF"
        colorPressed: "#79EFF0F3"

        textColor: "#2B2B2B"
        textColorHovered: "#2B2B2B"
        textColorPressed: "#2B2B2B"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }



    property TalButtonStyle successLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#07AA6E"
        colorHovered: "#11C381"
        colorPressed: "#04774D"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle successMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#07AA6E"
        colorHovered: "#11C381"
        colorPressed: "#04774D"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle successSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#07AA6E"
        colorHovered: "#11C381"
        colorPressed: "#04774D"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }



    property TalButtonStyle errorLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#FF4D5B"
        colorHovered: "#FF626E"
        colorPressed: "#B2353F"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle errorMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#FF4D5B"
        colorHovered: "#FF626E"
        colorPressed: "#B2353F"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle errorSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#FF4D5B"
        colorHovered: "#FF626E"
        colorPressed: "#B2353F"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }




    property TalButtonStyle warningLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#FE9400"
        colorHovered: "#FFB041"
        colorPressed: "#CE9A0A"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle warningMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"

        color:  "#FE9400"
        colorHovered: "#FFB041"
        colorPressed: "#CE9A0A"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"

    }


    property TalButtonStyle warningSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

        loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_white.gif"


        color:  "#FE9400"
        colorHovered: "#FFB041"
        colorPressed: "#CE9A0A"

        textColor: "#FFFFFF"
        textColorHovered: "#FFFFFF"
        textColorPressed: "#FFFFFF"

        borderColor: "#00000000"
        borderColorHovered:  "#00000000"
        borderColorPressed:  "#00000000"
    }


    property TalButtonStyle tertiaryGoastLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

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


    property TalButtonStyle tertiaryGoastMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

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


    property TalButtonStyle tertiaryGoastSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

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



    property TalButtonStyle demoIconButtonRightLarge: TalButtonStyle {
        width: largeWidth
        height: largeHeight
        fontPixelSize: largeFontPixelSize

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

        iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"
    }


    property TalButtonStyle demoIconButtonRightMedium: TalButtonStyle {
        width: mediumWidth
        height: mediumHeight
        fontPixelSize: mediumFontPixelSize

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

        iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"

    }


    property TalButtonStyle demoIconButtonRightSmall: TalButtonStyle {

        width: smallWidth
        height: smallHeight
        fontPixelSize: smallFontPixelSize

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

        iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"

    }



}
