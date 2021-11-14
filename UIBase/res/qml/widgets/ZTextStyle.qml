import QtQuick 2.0
import UIBase 1.0

QtObject {

    /// 主题色
    enum ThemeColor {
        Black, White
    }
    /// 大小
    enum Size {
        TitlePrimary, TitleSecondary, Content, AssistPrimary, AssistSecondary
    }
    /// 颜色等级
    enum ColorLevel {
        L100, L80, L70, L30
    }

    property var theme: ZTextStyle.ThemeColor.Black
    property var size: ZTextStyle.Size.TitlePrimary
    property var level: ZTextStyle.ColorLevel.L100
    property bool fontBold: false

    readonly property real fontOpacity: level === ZTextStyle.ColorLevel.L80 ? 0.8 : 1


    function fontFamily() {
        if (fontBold) {
            return "Microsoft YaHei";
        } else {
            return "Microsoft YaHei";
        }
    }

    function fontPixelSize() {
        if (size === ZTextStyle.Size.TitlePrimary) {
            return Destiny.dp(24);
        } else if (size === ZTextStyle.Size.TitleSecondary) {
            return Destiny.dp(18);
        } else if (size === ZTextStyle.Size.Content) {
            return Destiny.dp(16);
        } else if (size === ZTextStyle.Size.AssistPrimary) {
            return Destiny.dp(14);
        } else if (size === ZTextStyle.Size.AssistSecondary) {
            return Destiny.dp(12);
        }
        return Destiny.dp(12);
    }

    function fontColor() {
        if (theme === ZTextStyle.ThemeColor.Black) {
            if (level === ZTextStyle.ColorLevel.L100) {
                return "#2B2B2B";
            } else if (level === ZTextStyle.ColorLevel.L80) {
                return "#2B2B2B";
            } else if (level === ZTextStyle.ColorLevel.L70) {
                return "#7E7E7E";
            } else if (level === ZTextStyle.ColorLevel.L30) {
                return "#B6B6B6";
            }
        } else {
            if (level === ZTextStyle.ColorLevel.L100) {
                return "#FFFFFF";
            } else if (level === ZTextStyle.ColorLevel.L80) {
                return "#FFFFFF";
            } else if (level === ZTextStyle.ColorLevel.L70) {
                return "#909093";
            } else if (level === ZTextStyle.ColorLevel.L30) {
                return "#444E55";
            }
        }
        return "#000000";
    }
}
