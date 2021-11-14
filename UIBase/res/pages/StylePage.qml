import QtQuick 2.0
import QtQuick.Controls 1.5

import TalDisplay 1.0

import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

import "./items"
import "./list"
import "qrc:/uibase/qml/talwidget/TalColor.js" as TalColor

Rectangle {
    anchors.fill: parent

    TopBar {
        id: topBar
        text: "样式"
    }

    ScrollView {
        id: conentScrollView
        anchors { left: parent.left; top: topBar.bottom; right: parent.right; bottom: parent.bottom; leftMargin: Destiny.dp(24);  }
        width: parent.width
        height: parent.height

        Rectangle {
            id: contentView

            width: childrenRect.width
            height: childrenRect.height + 100

            ////////////////////////////////////////////////////////////////////////////
            // 颜色
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: colorRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: parent.top; topMargin: Destiny.dp(90); }

                TalText {
                    id: titleColor
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "01 color"
                }

                Row {
                    id: rowColor
                    width: childrenRect.width
                    height: childrenRect.height
                    anchors { left: parent.left; top: titleColor.bottom; topMargin: Destiny.dp(45) }

                    spacing: Destiny.dp(96)
                    ListView {
                        id: colorGrayListView
                        width: Destiny.dp(320)
                        height: childrenRect.height
                        enabled: false

                        orientation: ListView.Vertical
                        snapMode: ListView.SnapToItem
                        clip: true

                        model: ItemColorGray {}
                        delegate: SimpleColorItemComponent {}
                    }

                    GridView {
                        width: cellWidth * 3 - Destiny.dp(96)
                        height: cellHeight * 5
                        cellWidth: Destiny.dp(320 + 96)
                        cellHeight: Destiny.dp(72)
                        flow: GridView.FlowTopToBottom

                        enabled: false

                        model: ItemColorYellowOrangeRed {}
                        delegate: SimpleColorItemComponent {}
                    }
                }

                GridView {
                    height: cellHeight * 5
                    width: cellWidth * 4 - Destiny.dp(96)
                    anchors { left: parent.left; top: rowColor.bottom; topMargin: 24 }
                    enabled: false

                    cellWidth: Destiny.dp(320 + 96)
                    cellHeight: Destiny.dp(72)
                    flow: GridView.FlowTopToBottom

                    model: ItemColorGreenBluePurple {}
                    delegate: SimpleColorItemComponent {}
                }
            }

            Rectangle {
                id: color2Rect
                width: parent.width
                height: childrenRect.height

                anchors { left: parent.left; top: colorRect.bottom; topMargin: 64 }

                TalText {
                    id: titleColor2
                    text: "02 config"
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                }

                GridView {
                    width: cellWidth * 3
                    height: cellHeight * 3
                    anchors { left: parent.left; top: titleColor2.bottom; topMargin: 24 }
                    cellWidth: Destiny.dp(320 + 96)
                    cellHeight: Destiny.dp(72)
                    flow: GridView.FlowTopToBottom
                    enabled: false

                    model: ItemConfigColor{}
                    delegate: SimpleColorItemComponent {}
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Background
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: backgroundRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: color2Rect.bottom; topMargin: 48}

                TalText {
                    id: titleBackground
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "03 background"
                }

                Row {
                    anchors { top: titleBackground.bottom; topMargin: 40 }
                    spacing: Destiny.dp(96)

                    Column {
                        width: childrenRect.width
                        height: childrenRect.height
                        enabled: false
                        spacing: Destiny.dp(8)

                        TalShape {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            shape: TalShape.Shape.Primary
                        }

                        TalText {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
                            text: "03 background/01 primary"
                        }

                        TalShape {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            shape: TalShape.Shape.Secondary
                        }

                        TalText {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
                            text: "03 background/02 secondary"
                        }

                        TalShape {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            shape: TalShape.Shape.Navigation
                        }

                        TalText {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
                            text: "03 background/03 navgation"
                        }
                    }

                    Column {
                        width: childrenRect.width
                        height: childrenRect.height
                        enabled: false
                        spacing: Destiny.dp(8)

                        TalShape {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            shape: TalShape.Shape.TimerCounting
                        }

                        TalText {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
                            text: "03 background/04 timer count"
                        }

                        TalShape {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            shape: TalShape.Shape.TimerFinish
                        }

                        TalText {
                            width: Destiny.dp(320)
                            height: Destiny.dp(32)
                            talStyle: TalTextStyleBlack { size: TalTextStyle.Size.Content }
                            text: "03 background/05 timer finish"
                        }
                    }

                    GridView {

                        width: cellWidth * 1
                        height: cellHeight * 4
                        cellWidth: Destiny.dp(320)
                        cellHeight: Destiny.dp(72)
                        flow: GridView.FlowTopToBottom
                        enabled: false

                        model: ListModel {
                            Component.onCompleted:  {
                                append({name: "03 background/100", colorName: TalColor.colorBackground100 })
                                append({name: "03 background/200", colorName: TalColor.colorBackground200 })
                                append({name: "03 background/300", colorName: TalColor.colorBackground300 })
                                append({name: "03 background/500", colorName: TalColor.colorBackground500 })
                            }
                        }
                        delegate: SimpleColorItemComponent {}
                    }
                }
            }


            ////////////////////////////////////////////////////////////////////////////
            // Card
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: cardRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: backgroundRect.bottom; topMargin: 48}

                TalText {
                    id: titleCard
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "04 card"
                }

                CardRow {
                    anchors { left: parent.left; top: titleCard.bottom; topMargin: 36; }
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Button
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: buttonRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: cardRect.bottom; topMargin: 48}

                TalText {
                    id: titleButton
                    width: parent.width
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "05 button"
                }

//                Row {
//                    anchors { top: titleButton.bottom; topMargin: 40 }
//                    spacing: 10

//                    ButtonListLeft { }

//                    ButtonListCenter { }

//                    ButtonListRight { }
//                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Shadow
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: shadowRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: buttonRect.bottom; topMargin: 48}

                TalText {
                    id: titleShadow
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "06 shadow"
                }

                GridView {
                    width: cellWidth * 2
                    height: cellHeight
                    enabled: false
                    anchors.top: titleShadow.bottom
                    anchors.topMargin: Destiny.dp(24)

                    cellWidth: Destiny.dp(320 + 96)
                    cellHeight: Destiny.dp(72)

                    model: ListModel {
                        Component.onCompleted:  {
                            append({name: "06 shadow/01 primary", colorName: TalColor.colorShadowPrimary })
                            append({name: "06 shadow/02 secondary", colorName: TalColor.colorShadowSecondary })
                        }
                    }
                    delegate: SimpleColorItemComponent { }
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Tag
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: tagRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: shadowRect.bottom; topMargin: 48}

                TalText {
                    id: titleTag
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "07 tag"
                }

                TagRow {
                    anchors { left: parent.left; top: titleTag.bottom; topMargin: 36; }
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Divider
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: dividerRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: tagRect.bottom; topMargin: 48}

                TalText {
                    id: titleDivider
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "08 divider"
                }

                GridView {
                    width: cellWidth * 4
                    height: cellHeight
                    anchors.top: titleDivider.bottom
                    anchors.topMargin: Destiny.dp(24)
                    enabled: false

                    cellWidth: Destiny.dp(320 + 96)
                    cellHeight: Destiny.dp(72)

                    model: ListModel {
                        Component.onCompleted:  {
                            append({name: "08 divider/01 primary", colorName: TalColor.colorDividerPrimary })
                            append({name: "08 divider/02 secondary", colorName: TalColor.colorDividerSecondary })
                            append({name: "08 divider/02 secondary 80", colorName: TalColor.colorDividerSecondary80 })
                            append({name: "08 divider/03 tertiary", colorName: TalColor.colorDividerTertiary })
                        }
                    }
                    delegate: SimpleColorItemComponent { }
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // Input
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: inputRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: dividerRect.bottom; topMargin: 48}

                TalText {
                    id: titleInput
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "09 input"
                }

                InputRow {
                    anchors { left: parent.left; top: titleInput.bottom; topMargin: 36; }
                }
            }

            ////////////////////////////////////////////////////////////////////////////
            // BrushPalette
            ////////////////////////////////////////////////////////////////////////////
            Rectangle {
                id: brushPaletteRect
                width: childrenRect.width
                height: childrenRect.height

                anchors { left: parent.left; top: inputRect.bottom; topMargin: 48}

                TalText {
                    id: titleBrushPalette
                    width: parent.width

                    anchors { left: parent.left; top: parent.top; }
                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "10 brush color palette"
                }

                GridView {
                    anchors.top: titleBrushPalette.bottom
                    anchors.topMargin: Destiny.dp(45)

                    width: cellWidth * 2
                    height: cellHeight * 5
                    cellWidth: Destiny.dp(320 + 96)
                    cellHeight: Destiny.dp(72)
                    flow: GridView.FlowTopToBottom
                    enabled: false

                    model: ItemColorBrush {}
                    delegate: SimpleColorItemComponent {}
                }
            }
        }
    }

}
