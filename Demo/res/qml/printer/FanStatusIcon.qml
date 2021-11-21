import QtQuick 2.0

QtObject {

    Component.onCompleted: {
        topBar.add("fan", fan)
    }

    property var fan: Component {

        Image {
            width: 20
            height: 20
            source: ""

            Rectangle {
                anchors.fill: parent
                color: "red"
            }
        }

    }

}
