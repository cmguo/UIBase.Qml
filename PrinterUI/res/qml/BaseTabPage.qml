import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property var subdir
    property var pages
    property string activePage
    property alias barHeight: tabBar.height
    property alias buttonDelegate: tabBar.delegate
    property var pageHandler

    anchors.fill: parent
    anchors.bottomMargin: pageHandler ? (parent.height - tabBar.height) : 0

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

        StackView {
            id: pageStack
            anchors.fill: parent
            replaceEnter: null
            replaceExit: null
        }
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
        if (pageHandler) {
            pageHandler.handle();
            return;
        }
//        var c = pageContainer.children[0]
//        if (c) {
//            c.destroy()
//            c.parent = null
//        }
//        pageComponent.createObject(pageContainer, { url: "" + subdir + "/" + activePage + "Page.qml" })
        pageStack.replace(null, subdir + "/" + activePage + "Page.qml")
    }
}
