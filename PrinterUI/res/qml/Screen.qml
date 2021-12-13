import QtQuick 2.12
import QtQuick.Controls 2.12

Item {

    id: screen
    width: 1280
    height: 720

    Rectangle {
        anchors.fill: parent
        color: "#F0F0F0"
    }

    Item {
        id: pageContainer
        width: parent.width - navigator.width
        height: parent.height - statusBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        StackView {
            id: pageStack
            anchors.fill: parent
            replaceEnter: null
            replaceExit: null
        }
    }

    Navigator {
        id: navigator
        height: parent.height
        width: 128
        pages: ListModel {
            ListElement {
                name: "Home"
                icon: "home.svg"
            }
            ListElement {
                name: "Printer"
                icon: "print_control.svg"
            }
            ListElement {
                name: "Models"
                icon: "file.svg"
            }
            ListElement {
                name: "Settings"
                icon: "setting.svg"
            }
            ListElement {
                name: "Assistant"
                icon: "help.svg"
            }
        }
        property string realPage: (printManager.printing && activePage == "Home") ? "Home2" : activePage
        onRealPageChanged: {
//            var c = pageContainer.children[0]
//            if (c) {
//                c.destroy()
//                c.parent = null
//            }
//            pageComponent.createObject(pageContainer, { url: "main/" + realPage + "Page.qml" })
            pageStack.replace(null, "main/" + realPage + "Page.qml")
        }
        Component.onCompleted: {
            activePage = "Home"
        }
    }

    StatusBar {
        id: statusBar
        height: 48

        // for test
        TapHandler {
            onTapped: {
                printManager.printing = !printManager.printing
            }
        }
    }

    Item {
        anchors.fill: parent
        StackView {
            id: dialogStack
            anchors.fill: parent

            function popDialog(dialog, args) {
                push("Dialog.qml", {url: "dialog/" + dialog + ".qml", args: args})
            }
            pushEnter: null
            pushExit: null
            popEnter: null
            popExit: null
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

        property var task: QtObject {
            property var plates: ListModel{
                ListElement {
                    snapshot: ""
                    done: true
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
                ListElement {
                    snapshot: ""
                    done: true
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
                ListElement {
                    snapshot: ""
                    done: false
                }
            }
        }

        function printModel(name) {
            printing = true
        }
    }

}