import QtQuick 2.12
import QtQuick.Controls 2.12
import Printer 1.0

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
        property bool printing: PrintManager.currentTask && PrintManager.currentTask.printStep > 0
        property string realPage: (printing && activePage == "Home") ? "Home2" : activePage
        property var cachedPages: ({})
        onRealPageChanged: {
            var page = cachedPages[realPage]
            if (page === undefined) {
                page = pageComponent.createObject(pageContainer, { url: "main/" + realPage + "Page.qml" })
                cachedPages[realPage] = page;
            }
            pageStack.replace(null, page)
        }
        Component.onCompleted: {
            activePage = "../tests/PointTest"
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

            Loader{
                focus: true
                source: parent.url
                anchors.fill: parent
            }
        }
    }

    property var printManager: QtObject {

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
