import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0



Item {
    width: Destiny.dp(50)
    height: Destiny.dp(50)

    AnimatedImage  {
        anchors.fill: parent
        source: "qrc:/uibase/drawable/tal_progress_loading.gif"
        playing: true
        visible: parent.visible
    }
}
