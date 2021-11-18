import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    id: navigator

    property string activeItem

    Rectangle {
        anchors.fill: parent
        color: "#3B3C40"

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
                    objectName: "Assistant"
                    icon: "qrc:/uibase/drawable/setting_abandend.svg"
                    url: "qrc:/uidemo/qml/AssistantPage.qml"
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

            Item {
                width: parent.width
                height: list.height / 5

                ZButton {
                    anchors.centerIn: parent
                    backgroundColor: StateListColors.get(
                                         url == activeItem ? "#00AE42" : "transparent")

                    Image {
                        anchors.centerIn: parent
                        source: icon
                    }

                    onClicked: {
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
