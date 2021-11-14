import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id: imageContainer

    property string source: ""
    property string tintColor: ""

    Image {
        id: image
//        width: parent.width
//        height: parent.height
        fillMode: Image.PreserveAspectFit
        sourceSize: Qt.size(parent.width, parent.height)
        source: imageContainer.source
        smooth: true
        visible: !isShowOverlay()
    }

    ColorOverlay {
        anchors.fill: image
        source: image
        color: imageContainer.tintColor
        visible: isShowOverlay()
    }

    function isShowOverlay() {
        return tintColor !== "";
    }
}
