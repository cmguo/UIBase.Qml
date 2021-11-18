import QtQuick 2.12
import QtGraphicalEffects 1.12
import UIBase 1.0

Item {

    id: navigator

    property string activeItem

    DropShadow {
        anchors.fill: content
        horizontalOffset: 3
        verticalOffset: 3
        radius: 15
        samples: 31
        cached: true
        color: "#40000000"
        source: content
    }

    Rectangle {
        id: content
        anchors.fill: parent
        radius: 30
        color: "#3B3C40"

        Rectangle {
            width: 30
            height: 30
            color: "#3B3C40"
        }

        Rectangle {
            width: 30
            height: 30
            anchors.bottom: parent.bottom
            color: "#3B3C40"
        }

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
                    width: 74
                    height: 74
                    anchors.centerIn: parent
                    property bool checked: url == activeItem
                    backgroundColor: StateColors.get("transparent_checked")

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
