import QtQuick 2.0
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    anchors.fill: parent

    property var subdir
    property var pages
    property string activePage
    property alias barHeight: tabBar.height
    property alias buttonDelegate: tabBar.delegate

    ListView {
        id: tabBar
        width: contentWidth
        height: 80
        anchors.horizontalCenter: parent.horizontalCenter
        orientation: Qt.Horizontal
        model: pages
        delegate: Component {
            Item {
                width: pageContainer.width / pages.count
                height: tabBar.height

                ZButton {
                    width: 150
                    height: 62
                    anchors.centerIn: parent
                    text: title
                    textSize: 30
                    property bool checked: name === activePage
                    textColor: StateColors.get("font2_checked")
                    backgroundColor: StateColors.get("transparent_checked")

                    onClicked: {
                        activePage = name
                    }
                }
            }
        }

    }

    Item {
        id: pageContainer
        width: parent.width
        height: parent.height - tabBar.height - 20
        anchors.bottom: parent.bottom
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
        pageComponent.createObject(pageContainer, { url: "qrc:/uidemo/qml/" + subdir + "/" + activePage + "Page.qml" })
    }
}
