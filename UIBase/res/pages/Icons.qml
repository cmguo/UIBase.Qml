import QtQuick 2.0
import QtQuick.Controls 1.5

import TalDisplay 1.0


import "qrc:/uibase/qml/talwidget"
import "qrc:/uibase/qml/talwidget/styles"

import "./icon"

Rectangle {
    anchors.fill: parent

    TopBar {
        id: topBar
        text: "通用丨图标"
    }

    ScrollView {
        id: conentScrollView
        anchors { left: parent.left; top: topBar.bottom; topMargin: Destiny.dp(16); leftMargin: Destiny.dp(24);  }
        width: parent.width
        height: parent.height - topBar.height - anchors.topMargin

        Column {
            id: contentView
            width: conentScrollView.width
            height: childrenRect.height + 100
            anchors.top: parent.top
            anchors.topMargin: Destiny.dp(80)

            ////////////////////////////////////////////////////////////////////////////
            // 16px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                highlight: Rectangle { color: "#10FF0000" }
                header: Component {
                    TalText {
                        height: Destiny.dp(64)
                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "16px"
                    }
                }

                model: Icon16 {}
                delegate: IconComponent {}
            }

            ////////////////////////////////////////////////////////////////////////////
            // 24px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                header: Component {
                    TalText {
                        height: Destiny.dp(64)

                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "24px"
                    }
                }

                model: Icon24 {}
                delegate: IconComponent {}
            }

            ////////////////////////////////////////////////////////////////////////////
            // 32px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                header: Component {
                    TalText {
                        height: Destiny.dp(64)

                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "32px"
                    }
                }

                model: Icon32 {}
                delegate: IconComponent {}
            }

            ////////////////////////////////////////////////////////////////////////////
            // 40px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                header: Component {
                    TalText {
                        height: Destiny.dp(64)

                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "40px"
                    }
                }

                model: Icon40 {}
                delegate: IconComponent {}
            }

            ////////////////////////////////////////////////////////////////////////////
            // 48px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                header: Component {
                    TalText {
                        height: Destiny.dp(64)

                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "48px"
                    }
                }

                model: Icon48 {}
                delegate: IconComponent {}
            }

            ////////////////////////////////////////////////////////////////////////////
            // 64px
            ////////////////////////////////////////////////////////////////////////////

            GridView {
                width: parent.width
                height: childrenRect.height
                snapMode: GridView.SnapToRow
                enabled : false

                header: Component {
                    TalText {
                        height: Destiny.dp(64)

                        talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                        text: "64px"
                    }
                }

                model: Icon64 {}
                delegate: IconComponent {}
            }

            Column {

                TalText {
                    height: Destiny.dp(64)

                    talStyle: TalTextStyleBlack { size: TalTextStyle.Size.TitleSecondary }
                    text: "others"
                }

                Image {
                    source: "qrc:/uibase/drawable/uibase_eraser.svg"
                }
            }
        }
    }


}
