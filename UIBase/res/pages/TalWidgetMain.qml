import QtQuick 2.0

import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0

Rectangle {
    color: "white"

    Item {
        id: leftLayout
        width: Destiny.dp(200)
        height: parent.height

        TalImage{
            id: leftLogo
            width: parent.width
            height: Destiny.dp(92)
            source: "qrc:/uibase/drawable/uibase_main_logo.svg"
            fillMode: Image.PreserveAspectFit
            verticalAlignment: Image.AlignVCenter
        }

        TalListView {
            id: leftListView
            width: parent.width
            height: parent.height - leftLogo.height
            anchors.top: leftLogo.bottom

            model: ListModel {
                id: listModel
//                ListElement{
//                    name:"Colors"
//                    qml:"qrc:/uibase/qml/pages/ColorPage.qml"
//                }
                ListElement{
                    name:"Buttons"
                    qml:"qrc:/uibase/qml/pages/ButtonPage.qml"
                }
                ListElement{
                    name:"Text"
                    qml:"qrc:/uibase/qml/pages/TextPage.qml"
                }
                ListElement{
                    name:"样式"
                    qml:"qrc:/uibase/qml/pages/StylePage.qml"
                }
                ListElement{
                    name:"图标"
                    qml:"qrc:/uibase/qml/pages/Icons.qml"
                }
                ListElement{
                    name:"EasyComponents"
                    qml:"qrc:/uibase/qml/pages/EasyComponentPage.qml"
                }
                ListElement{
                    name:"小杨同学"
                    qml:"qrc:/uibase/qml/demo/ShaoZengDemo.qml"
                }
//                ListElement{
//                    name:"测试使用"
//                    qml:"qrc:/uibase/qml/pages/Test.qml"
//                }
            }

            delegate: Rectangle {
                id: itemLayout
                width: parent.width
                height: Destiny.dp(50)

                property bool isCurrentItem: {
                    return ListView.isCurrentItem
                }

                TalText {
                    text: name
                    font.pixelSize: Destiny.dp(14)
                    width: parent.width * 0.7
                    anchors.centerIn: parent
                    color: "#2B2B2B"
                }

                Rectangle {
                    width: Destiny.dp(5)
                    height: Destiny.dp(36)
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#5856D6"
                    visible: itemLayout.isCurrentItem
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        contentLoader.setSource(qml)
                        leftListView.currentIndex = index
                    }
                }
            }

            Component.onCompleted: {
                contentLoader.setSource(listModel.get(0)['qml'])
            }
        }

        Rectangle {
            id:divider
            width: Destiny.dp(1)
            color:"#E2E3E4"
            height: parent.height
            anchors.right: parent.right
        }
    }


    Rectangle {
        anchors.left: leftLayout.right
        color: "transparent"
        width: parent.width - leftLayout.width
        height: parent.height

        Loader {
            anchors.left: parent.left
            anchors.leftMargin: Destiny.dp(24)
            anchors.right: parent.right
            anchors.rightMargin: Destiny.dp(24)
            height: parent.height
            id: contentLoader
        }
    }

}
