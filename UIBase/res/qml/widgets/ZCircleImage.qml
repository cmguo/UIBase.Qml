import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


import "./"
import QtGraphicalEffects 1.0

//source: "http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fimages.ali213.net%2Fpicfile%2Fpic%2F2013%2F04%2F10%2F927_lq%2520%25289%2529.jpg&thumburl=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D1912956482%2C2097081754%26fm%3D26%26gp%3D0.jpg"

Image {
    id: img
    property bool rounded: true
    property bool adapt: true

    height: width
    layer.enabled: rounded
    layer.effect: OpacityMask {
        maskSource: Item {
            width: img.width
            height: img.height
            Rectangle {
                anchors.centerIn: parent
                width: img.adapt ? img.width : Math.min(img.width, img.height)
                height: img.adapt ? img.height : width
                radius: Math.min(width, height)
            }
        }
    }
}
