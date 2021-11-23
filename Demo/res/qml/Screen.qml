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
        width: parent.width - navigator.width
        height: parent.height - statusBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        StackView {
            id: pageStack
            anchors.fill: parent
            replaceEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }
            replaceExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }
        }
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
