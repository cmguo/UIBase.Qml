import QtQuick 2.12

Item {

    width: 1280
    height: 720

    Rectangle {
        anchors.fill: parent
        color: "#F8F8F8"
    }

    Navigator {
        id: navigator
        height: parent.height
        width: 100

        onActiveItemChanged: {
            var c = pageContainer.children[0]
            if (c) {
                c.destroy()
                c.parent = null
            }
            pageComponent.createObject(pageContainer, { url: navigator.activeItem })
        }
    }

    TopBar {
        id: topBar
    }

    Item {
        id: pageContainer
        width: parent.width - navigator.width
        height: parent.height - topBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    Component {
        id: pageComponent
        Rectangle {
            id: page
            clip: true
            property url url
            anchors.fill: parent
            color: "white"

            TapHandler {
                //Eats mouse events
            }
            Loader{
                focus: true
                source: parent.url
                anchors.fill: parent
            }
        }
    }

}
