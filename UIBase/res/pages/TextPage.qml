import QtQuick 2.0
import QtQuick.Controls 1.5

import TalDisplay 1.0
import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Rectangle {

    anchors.fill: parent
    color: "white"

    // 标题栏
    Rectangle {
        id: title
        width: parent.width
        height: 56
        anchors.left: parent.left
        anchors.leftMargin: 16
        color: "white"

        TalText {
            id: titleText
            text: "字体"
            anchors.bottom: parent.bottom
        }
    }

    // 滚动视图
    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height - title.height - anchors.topMargin
        anchors.top: title.bottom
        anchors.left: parent.left

        Rectangle {
            // 主内容
            id: scrollContainer
            width: scrollView.width
            height: childrenRect.height
            anchors.left: parent.left

            Rectangle { // 白底黑字
                id: topTextArea
                width: parent.width
                height: childrenRect.height + whiteBackgroundAndBlackText.anchors.topMargin + 100
                anchors.left: parent.left
                anchors.leftMargin: Destiny.dp(24)

                TalText {
                    id: whiteBackgroundAndBlackText
                    anchors.top: topTextArea.top
                    anchors.topMargin: 50
                    text: "白底黑字"
                    talStyle: TalTextStyleBlack { fontBold: true }
                }

                Row { // 一级标题
                    id: titlePrimaryRow
                    spacing: Destiny.dp(140)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: whiteBackgroundAndBlackText.bottom
                    anchors.topMargin: 25

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80 }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary;  }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary;  }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/bold/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/black/regular/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 二级标题
                    id: titleSecondaryRow
                    spacing: Destiny.dp(140)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: titlePrimaryRow.bottom
                    anchors.topMargin: 80


                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70 }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/center/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/center/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/center/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/center/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/center/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/center/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/bold/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/black/regular/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row {  // 内容
                    id: contentRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: titleSecondaryRow.bottom
                    anchors.topMargin: 80


                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        // 内容开始
                        TalText {
                            width: parent.width
                            text: "content/black/bold/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/left/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/left/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70 }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/left/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30 }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "content/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/center/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/center/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/center/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/center/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/center/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/center/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "content/black/bold/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/right/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/right/80"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/right/70"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/bold/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/black/regular/right/30"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 一级辅助文字
                    id: assistPrimaryRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: contentRow.bottom
                    anchors.topMargin: 80

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignLeft
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/left/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/left/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/left/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/left/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/left/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/left/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/bold/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/black/regular/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 二级辅助文字
                    id: assistSecondaryRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: assistPrimaryRow.bottom
                    anchors.topMargin: 80

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignLeft
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/left/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/left/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/left/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/left/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/left/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/left/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/left/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/100"
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/80"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L80; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/70"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L70; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/bold/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/black/regular/center/30"
                            talStyle: TalTextStyleBlack { level: TalTextStyle.ColorLevel.L30; size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }
            }

            Rectangle {  // 黑底白字
                id: bottomTextArea
                width: parent.width
                height: childrenRect.height + 150
                anchors.top: topTextArea.bottom
                color: "#2B3034"

                TalText {
                    id: blackBackgroundAndWhiteText
                    anchors.top: bottomTextArea.top
                    anchors.topMargin: 50
                    text: "黑底白字"
                    talStyle: TalTextStyleWhite { }
                }

                Row { // 一级标题
                    id: titlePrimaryWhiteRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: blackBackgroundAndWhiteText.bottom
                    anchors.topMargin: 25

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary;  }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary;  }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary;  }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/bold/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/primary/white/regular/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitlePrimary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 二级标题
                    id: titleSecondaryWhiteRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: titlePrimaryWhiteRow.bottom
                    anchors.topMargin: 80

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary;  }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary;  }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary;  }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/bold/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "title/secondary/white/regular/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.TitleSecondary; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row {  // 内容
                    id: contentWhiteRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: titleSecondaryWhiteRow.bottom
                    anchors.topMargin: 80


                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        // 内容开始
                        TalText {
                            width: parent.width
                            text: "content/white/bold/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content;}
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "content/white/bold/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content;}
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "content/white/bold/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content;}
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L70; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/bold/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "content/white/regular/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.Content; level: TalTextStyle.ColorLevel.L30; }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 一级辅助文字
                    id: assistPrimaryWhiteRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: contentWhiteRow.bottom
                    anchors.topMargin: 80

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70 }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30 }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/bold/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/primary/white/regular/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistPrimary; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }

                Row { // 二级辅助文字
                    id: assistSecondaryWhiteRow
                    spacing: Destiny.dp(150)
                    width: parent.width
                    height: childrenRect.height
                    anchors.top: assistPrimaryWhiteRow.bottom
                    anchors.topMargin: 80

                    // 左对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/left/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/left/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/left/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70 }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/left/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30 }
                        }
                    }

                    // 居中对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/center/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/center/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/center/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignHCenter
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/center/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    // 右对齐
                    Column {
                        spacing: 8
                        width: Destiny.dp(450)

                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/right/100"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/right/80"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L80; }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/right/70"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L70 }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/bold/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30; fontBold: true }
                            horizontalAlignment: Text.AlignRight
                        }
                        TalText {
                            width: parent.width
                            text: "assist/secondary/white/regular/right/30"
                            talStyle: TalTextStyleWhite { size: TalTextStyle.Size.AssistSecondary; level: TalTextStyle.ColorLevel.L30 }
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }
            }
        }
    }
}
