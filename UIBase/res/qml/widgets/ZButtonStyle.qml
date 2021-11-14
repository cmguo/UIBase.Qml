import QtQuick 2.0
import UIBase 1.0


QtObject {

    enum Size {
        L,
        M,
        S
    }

    property var size: ZButtonStyle.Size.L

    property var radius: height/2

    property int width: getWidth(size)
    property int height: getHeight(size)

    // if set this to 1.0, would use xxxColorDisabled source
    property var opacityDisabled: colorDisabled == color ? 0.3 : 1

    property var color : "#008FFF"
    property var colorHovered: "#1799FF"
    property var colorPressed: "#0065B4"
    property var colorDisabled: color
    property var colorLoading: color

    property var textColor: "#FFFFFF"
    property var textColorHovered: "#FFFFFF"
    property var textColorPressed: "#FFFFFF"
    property var textColorDisabled: textColor

    property var fontFamily: "Microsoft YaHei"
    property int fontPixelSize: getFontPixelSize(size)
    property var fontBold: false
    property var fontItalic: false

    property var loadingSource: "qrc:/uibase/drawable/uibase_loading_talbutton_gray.gif"

    property var iconLeft: ""
    property var iconLeftDisabled: iconLeft
    property var iconLeftWidth:iconLeft == "" ? 0: Destiny.dp(32)
    property var iconLeftHeight:iconLeft == "" ? 0: Destiny.dp(32)

    property var iconRight: ""
    property var iconRightDisabled: iconRight
    property int iconRightWidth: iconRight == "" ? 0: Destiny.dp(32)
    property int iconRightHeight:iconRight == "" ? 0: Destiny.dp(32)

    property int borderWidth: Destiny.dp(2)
    property var borderColor: "#00000000"
    property var borderColorHovered: "#00000000"
    property var borderColorPressed: "#00000000"
    property var borderColorDisabled: borderColor
    property var borderColorLoading: borderColor


    property int largeWidth: Destiny.dp(256)
    property int largeHeight: Destiny.dp(64)
    property int largeFontPixelSize: Destiny.dp(18)

    property int mediumWidth: Destiny.dp(180)
    property int mediumHeight: Destiny.dp(48)
    property int mediumFontPixelSize: Destiny.dp(16)

    property int smallWidth: Destiny.dp(84)
    property int smallHeight: Destiny.dp(40)
    property int smallFontPixelSize: Destiny.dp(16)

    function getWidth(size) {
//        switch(size) {
//        case ZButtonStyle.Size.L:
//            return largeWidth;
//        case ZButtonStyle.Size.M:
//            return mediumWidth;
//        case ZButtonStyle.Size.S:
//            return smallWidth;
//        }
//        return mediumWidth;
        return 0;
    }

    function getHeight(size) {
        switch(size) {
        case ZButtonStyle.Size.L:
            return largeHeight;
        case ZButtonStyle.Size.M:
            return mediumHeight;
        case ZButtonStyle.Size.S:
            return smallHeight;
        }
        return mediumHeight;
    }

    function getFontPixelSize(size) {
        switch(size) {
        case ZButtonStyle.Size.L:
            return largeFontPixelSize;
        case ZButtonStyle.Size.M:
            return mediumFontPixelSize;
        case ZButtonStyle.Size.S:
            return smallFontPixelSize;
        }
        return mediumFontPixelSize;
    }

}
