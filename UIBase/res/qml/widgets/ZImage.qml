import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


//import QtGraphicalEffects 1.0

Image {

    property bool circle: false

    fillMode: Image.PreserveAspectCrop

    //layer.enabled: circle
    //layer.effect: OpacityMask {
    //    maskSource: talImageMask
    //}
    anchors.margins: 0

    Rectangle {
        id: talImageMask
        anchors.fill: parent
        radius: Math.min(width,height)/2
        visible: false
        color: "black"
        border.width: 0
    }

    Component.onCompleted: {
        if(circle) {
            height = width;
        }
    }

}

