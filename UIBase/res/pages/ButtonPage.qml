import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0

import "qrc:/uibase/qml/talwidget/styles"

Rectangle {

    anchors.fill: parent

    color: "transparent"

    TopBar {
        id: topbar
        text: "通用|按钮"
    }

    Item {
        width: parent.width
        height: parent.height - topbar.height - anchors.topMargin
        anchors.top: topbar.bottom
        anchors.topMargin: Destiny.dp(91)

        ScrollView {
            id: scrollView
            width: parent.width
            height: parent.height
            clip: false

            Column {
                spacing: Destiny.dp(80)

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "01 primary"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.L
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.S
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "02 secondary"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleSecondary {
                                size: TalButtonStyle.Size.L
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleSecondary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleSecondary {
                                size: TalButtonStyle.Size.S
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "03 Ghost secondary"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostSecondary {
                                size: TalButtonStyle.Size.L
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostSecondary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostSecondary {
                                size: TalButtonStyle.Size.S
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                // black
                Item {
                    implicitWidth: scrollView.width
                    implicitHeight: childrenRect.height

                    Rectangle {
                        width: parent.width
                        height: parent.height + Destiny.dp(48)
                        y: Destiny.dp(24) * -1
                        color: "#2B3034"
                    }

                    Column {
                        spacing: Destiny.dp(80)

                        Column {
                            spacing: Destiny.dp(20)

                            TalText {
                                text: "04 ghost secondary"
                                color: "#FFFFFF"
                                font.pixelSize: Destiny.dp(16)
                                font.bold: true
                            }

                            Row {
                                spacing: Destiny.dp(100)
                                anchors.left: parent.left
                                anchors.leftMargin: Destiny.dp(40)

                                TalButton{
                                    text: "确认"
                                    talStyle: TalButtonStyleGhostPrimary { size: TalButtonStyle.Size.L }
                                    onClicked: {
                                       testClick(this)
                                    }
                                }

                                TalButton{
                                    text: "确认"
                                    talStyle:  TalButtonStyleGhostPrimary { size: TalButtonStyle.Size.M }
                                    onClicked: {
                                        testClick(this)
                                    }
                                }

                                TalButton{
                                    text: "确认"
                                    talStyle:  TalButtonStyleGhostPrimary { size: TalButtonStyle.Size.S }
                                    onClicked: {
                                        testClick(this)
                                    }
                                }
                            }

                        }


                        Column {
                            spacing: Destiny.dp(20)
                            anchors.left: parent.left
                            anchors.leftMargin: Destiny.dp(40)

                            TalText {
                                text: "03 tertiary"
                                color: "#FFFFFF"
                                font.pixelSize: Destiny.dp(16)
                                font.bold: true
                            }

                            Row {
                                spacing: Destiny.dp(100)

                                TalButton{
                                    text: "确认"
                                    talStyle: TalButtonStyleTertiary { size: TalButtonStyle.Size.L }
                                    onClicked: {
                                        testClick(this)
                                    }
                                }

                                TalButton{
                                    text: "确认"
                                    talStyle: TalButtonStyleTertiary { size: TalButtonStyle.Size.M }
                                    onClicked: {
                                        testClick(this)
                                    }
                                }

                                TalButton{
                                    text: "确认"
                                    talStyle: TalButtonStyleTertiary { size: TalButtonStyle.Size.S }
                                    onClicked: {
                                        testClick(this)
                                    }
                                }
                            }

                        }

                    }
                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "08 success"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleSuccess { size: TalButtonStyle.Size.L }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle:  TalButtonStyleSuccess { size: TalButtonStyle.Size.M }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle:  TalButtonStyleSuccess { size: TalButtonStyle.Size.S }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "07 error"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleError { size: TalButtonStyle.Size.L }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleError { size: TalButtonStyle.Size.M }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleError { size: TalButtonStyle.Size.S }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "09 warning"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle:  TalButtonStyleWarn { size: TalButtonStyle.Size.L }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleWarn { size: TalButtonStyle.Size.M }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleWarn { size: TalButtonStyle.Size.S }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "06 ghost tertiary"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostTertiary { size : TalButtonStyle.Size.L }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostTertiary { size : TalButtonStyle.Size.M }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "确认"
                            talStyle: TalButtonStyleGhostTertiary { size : TalButtonStyle.Size.S }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "07 icon demo"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "右边图标"
                            talStyle:  TalButtonStyleGhostTertiary {
                                size: TalButtonStyle.Size.L
                                iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"
                                iconLeft: ""
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "右边图标"
                            talStyle:  TalButtonStyleGhostTertiary {
                                size: TalButtonStyle.Size.M
                                iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"
                                iconLeft: ""
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }

                        TalButton{
                            text: "右边图标"
                            talStyle:  TalButtonStyleGhostTertiary {
                                size: TalButtonStyle.Size.S
                                iconRight: "qrc:/uibase/drawable/uibase_icon_close.png"
                                iconLeft: ""
                            }
                            onClicked: {
                                testClick(this)
                            }
                        }
                    }

                }

            }
        }
    }

    TalHandler {
        id:handler
    }

    function testClick(item) {
        item.loading = true
        handler.delay(3000,function() {
            item.loading = false;
            item.enabled = false;
        })
    }

}
