import QtQuick 2.12

Item {

    width: 1280
    height: 720

    Rectangle {
        anchors.fill: parent
        color: "#F0F0F0"
    }

    Navigator {
        id: navigator
        height: parent.height
        width: 108
        pages: ListModel {
            ListElement {
                name: "Home"
                icon: "qrc:/uibase/icon/play.svg"
            }
            ListElement {
                name: "Printer"
                icon: "qrc:/uibase/icon/setting1.svg"
            }
            ListElement {
                name: "Models"
                icon: "qrc:/uibase/icon/dir.svg"
            }
            ListElement {
                name: "Settings"
                icon: "qrc:/uibase/icon/setting_abandend.svg"
            }
            ListElement {
                name: "Assistant"
                icon: "qrc:/uibase/icon/setting2.svg"
            }
        }
        property string realPage: (printManager.printing && activePage == "Home") ? "Home2" : activePage
        onRealPageChanged: {
            var c = pageContainer.children[0]
            if (c) {
                c.destroy()
                c.parent = null
            }
            pageComponent.createObject(pageContainer, { url: "main/" + realPage + "Page.qml" })
        }
        Component.onCompleted: {
            activePage = "Home"
        }
    }

    TopBar {
        id: topBar
        height: 48

        // for test
        TapHandler {
            onTapped: {
                printManager.printing = !printManager.printing
            }
        }
    }

    Item {
        id: pageContainer
        width: parent.width - navigator.width
        height: parent.height - topBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    property var printManager: QtObject {

        property bool printing: false
        property var tempratures: ListModel {
            ListElement {
                name: "n1"
                icon: ""
                target: 40
                current: 27
            }
            ListElement {
                name: "n2"
                icon: ""
                target: 210
                current: 67
            }
            ListElement {
                name: "n3"
                icon: ""
                target: 210
                current: 67
            }
        }

        property var amsList: ListModel {
            ListElement {
                name: "BL_PLA"
                fcolor: "#FF7426"
                remain: 0.6
            }
            ListElement {
                name: "BL_PLA"
                fcolor: "#1ACF62"
                remain: 0.35
            }
            ListElement {
                name: "BL_PLA"
                fcolor: "#FFDD2C"
                remain: 0.75
            }
            ListElement {
                name: ""
                fcolor: ""
                remain: 0.75
            }
        }

        function printModel(name) {
            printing = true
        }
    }

    Component {
        id: pageComponent

        Item {
            id: page
            property url url
            anchors.fill: parent

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
