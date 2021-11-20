import QtQuick 2.12

QtObject {

    Component.onCompleted: {
        topBar.add("ams", ams)
    }

    property var ams: Component {

        ListView {
            width: contentWidth
            height: 20
            orientation: Qt.Horizontal
            spacing: 8
            model: ListModel {
                ListElement {
                    amscolor: "#F3942B"
                    remain: 11
                }
                ListElement {
                    amscolor: "#EE4633"
                    remain: 6
                }
                ListElement {
                    amscolor: "#22A0FB"
                    remain: 17
                }
                ListElement {
                    amscolor: "#35D692"
                    remain: 8
                }
            }
            delegate: Rectangle {
                width: 17
                height: 20
                radius: 3
                color: "#CFCFCF"

                Rectangle {
                    width: 17
                    height: remain
                    anchors.bottom: parent.bottom
                    radius: 3
                    color: amscolor
                }
            }
        }

    }

}
