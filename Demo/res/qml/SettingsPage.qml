import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    anchors.fill: parent

    property string activePage

    ListView {
        id: tabBar
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        width: parent.width
        height: 61
        orientation: Qt.Horizontal
        delegate: tabButton
        model: tabButtons

        Component {
            id: tabButton

            Item {
                width: tabBar.width / 5
                height: tabBar.height

                ZButton {
                    width: 150
                    height: 62
                    anchors.centerIn: parent
                    text: title
                    textSize: 30
                    property bool checked: name == activePage
                    textColor: StateListColors.get("font2_checked")
                    backgroundColor: StateListColors.get("transparent_checked")

                    onClicked: {
                        activePage = name
                    }
                }
            }
        }

        ListModel {
            id: tabButtons
            ListElement {
                name: "UserPage"
                title: "个人账号"
            }
            ListElement {
                name: "DevicePage"
                title: "本机设置"
            }
            ListElement {
                name: "NetworkPage"
                title: "网络设置"
            }
            ListElement {
                name: "RecorderPage"
                title: "录像设置"
            }
            ListElement {
                name: "LanguagePage"
                title: "语言设置"
            }
        }

    }

    Item {
        id: pageContainer
        width: parent.width
        height: parent.height - tabBar.height - 40
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }


    Component.onCompleted: {
        activePage = "UserPage"
    }

    Component {
        id: pageComponent

        Item {
            id: page
            clip: true
            property url url
            anchors.fill: parent

            Loader{
                focus: true
                source: parent.url
                anchors.fill: parent
            }
        }
    }

    onActivePageChanged: {
        var c = pageContainer.children[0]
        if (c) {
            c.destroy()
            c.parent = null
        }
        pageComponent.createObject(pageContainer, { url: "qrc:/uidemo/qml/" + activePage + ".qml" })
    }
}
