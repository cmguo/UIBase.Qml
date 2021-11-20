import QtQuick 2.12
import QtQuick.Shapes 1.12

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
                name: "Main"
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
        onActiveItemChanged: {
            var c = pageContainer.children[0]
            if (c) {
                c.destroy()
                c.parent = null
            }
            pageComponent.createObject(pageContainer, { url: "main/" + navigator.activeItem + "Page.qml" })
        }
    }

    TopBar {
        id: topBar
        height: 48
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

    Component {
        id: wifi

        Item {
            property int strength: 2

            Repeater {
                model: 4
                delegate: Shape {
                    ShapePath {
                        strokeColor: index <= strength ? "#1C1C1E" : "transparent"
                        strokeWidth: 2
                        fillColor: "transparent"
                        PathAngleArc {
                            centerX: 13
                            centerY: 17
                            radiusX: index * 4 + 1
                            radiusY: radiusX
                            startAngle: -45
                            sweepAngle: -90
                        }
                    }
                }
            }
        }

    }

    Component.onCompleted: {
        topBar.add("wifi", wifi)
    }

}
