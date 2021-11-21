import QtQuick 2.12

QtObject {

    Component.onCompleted: {
        statusBar.add("ams", ams)
    }

    property var ams: Component {

        ListView {
            width: contentWidth
            height: 20
            orientation: Qt.Horizontal
            spacing: 8
            model: printManager.amsList
            delegate: Rectangle {
                width: 17
                height: 20
                radius: 3
                color: "#CFCFCF"

                Rectangle {
                    width: 17
                    height: remain * parent.height
                    anchors.bottom: parent.bottom
                    radius: 3
                    color: fcolor
                }
            }
        }

    }

}
