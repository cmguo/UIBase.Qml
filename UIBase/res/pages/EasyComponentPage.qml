import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

import TalDisplay 1.0
import TalToast 1.0
import TalDialog 1.0

import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

Rectangle {

    anchors.fill: parent

    color: "transparent"

    TopBar {
        id: topbar
        text: "通用|简易组件"
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
                        text: "Toast"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "Toast Easy"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                 TalToast.makeGlobalToast("I am a toast :)",TalToast.None);
                            }
                        }

                        TalButton{
                            text: "Toast Loading"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                 TalToast.makeGlobalToast("I am loading ...",TalToast.Loading);
                            }
                        }

                        TalButton{
                            text: "Toast Success"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                 TalToast.makeGlobalToast("This is a succes toast !",TalToast.Success);
                            }
                        }

                        TalButton{
                            text: "Toast Error"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                 TalToast.makeGlobalToast("This is a error toast !",TalToast.Error);
                            }
                        }


                        TalButton{
                            text: "Close Toast"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                 TalToast.closeGlobalToast();
                            }
                        }

                    }

                }

                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "Dialog"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalButton{
                            text: "Dialog Easy"
                            talStyle: TalButtonStylePrimary {
                                size: TalButtonStyle.Size.M
                            }
                            onClicked: {
                                TalDialog.showGlobalDialog("This is a dialog");
                            }
                        }

                        //TODO lamnbada not passed from qml/c++

//                        TalButton{
//                            text: "Toast Easy Exec"
//                            talStyle: TalButtonStylePrimary {
//                                size: TalButtonStyle.Size.M
//                            }
//                            onClicked: {
//                                 TalDialog.execGlobalDialog("I am loading ...");
//                            }
//                        }


//                        TalButton{
//                            text: "Dialog Callback"
//                            talStyle: TalButtonStylePrimary {
//                                size: TalButtonStyle.Size.M
//                            }
//                            onClicked: {
//                                TalDialog.showGlobalDialog("This is a dialog", function() {
//                                    TalToast.showGlobalToast("Confirmed")
//                                } , function() {
//                                    TalToast.showGlobalToast("Canceled")
//                                });
//                            }
//                        }

//                        TalButton{
//                            text: "Dialog Only Confirm"
//                            talStyle: TalButtonStylePrimary {
//                                size: TalButtonStyle.Size.M
//                            }
//                            onClicked: {
//                                TalDialog.showGlobalDialog("This is a dialog", function() {
//                                    TalToast.showGlobalToast("Confirmed")
//                                } , function() {
//                                    TalToast.showGlobalToast("Canceled")
//                                }, false, 0, "Button1", "Button2");
//                            }
//                        }


//                        TalButton{
//                            text: "Dialog Only Full"
//                            talStyle: TalButtonStylePrimary {
//                                size: TalButtonStyle.Size.M
//                            }
//                            onClicked: {
//                                 TalToast.showGlobalDialog("I am loading ...", null, null, true);
//                            }
//                        }

                    }

                }


                Column {
                    spacing: Destiny.dp(20)

                    TalText {
                        text: "TalTabBar"
                        color: "#2B2B2B"
                        font.pixelSize: Destiny.dp(16)
                        font.bold: true
                    }

                    Row {
                        spacing: Destiny.dp(100)
                        anchors.left: parent.left
                        anchors.leftMargin: Destiny.dp(40)

                        TalTabBar {
                            id: tabBar
                            spacing: Destiny.dp(20)

                            delegate: TalButton {
                                height: parent.height
                                text: name
                                talStyle: TalButtonStyleTabBar{}
                                onClicked: {
                                    tabBar.currentIndex = index
                                }
                            }
                            model: ListModel {
                                ListElement {
                                    name: "Button1"
                                }
                                ListElement {
                                    name: "Button2"
                                }
                                ListElement {
                                    name: "Button3"
                                }
                            }
                            TalTabBarIndicator {
                                anchors.bottom: parent.bottom
                            }
                        }
                    }
                }
            }
        }
    }



}
