import QtQuick 2.12

Item {

    id: navigator

    property string activeItem

    Rectangle {
        anchors.fill: parent
        color: "blue"

        ListView {
            id: list
            anchors.fill: parent
            delegate: navItem
            model: ListModel {
                ListElement {
                    name: "Main"
                    icon: "qrc:/uibase/drawable/play.svg"
                    url: "qrc:/uidemo/qml/MainPage.qml"
                }
                ListElement {
                    name: "Printer"
                    icon: "qrc:/uibase/drawable/setting1.svg"
                    url: "qrc:/uidemo/qml/PrinterPage.qml"
                }
                ListElement {
                    name: "Models"
                    icon: "qrc:/uibase/drawable/dir.svg"
                    url: "qrc:/uidemo/qml/ModelsPage.qml"
                }
                ListElement {
                    objectName: "Settings"
                    icon: "qrc:/uibase/drawable/setting_abandend.svg"
                    url: "qrc:/uidemo/qml/SettingsPage.qml"
                }
            }
        }

        Component {
            id: navItem

            Rectangle {
                width: parent.width
                height: list.height / 4
                color: activeItem == url ? "red" : "yellow"

                Image {
                    anchors.centerIn: parent
                    source: icon
                }

                TapHandler {
                    onTapped: {
                        navigator.activeItem = url
                    }
                }
            }
        }

        Component.onCompleted: {
            activeItem = "qrc:/uidemo/qml/MainPage.qml"
        }
    }

}
