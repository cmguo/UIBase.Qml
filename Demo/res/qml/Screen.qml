import QtQuick 2.12

Item {

    width: 1280
    height: 720

    Navigator {
        id: navigator
        height: parent.height
        width: 100

        onActiveItemChanged: {
            pageComponent.createObject(pageContainer, { exampleUrl: navigator.activeItem })
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
            property url exampleUrl
            anchors.fill: parent
            color: "white"

            TapHandler {
                //Eats mouse events
            }
            Loader{
                focus: true
                source: parent.exampleUrl
                anchors.fill: parent
            }
        }
    }

}
