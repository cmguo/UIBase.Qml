import QtQuick 2.0
import TalDisplay 1.0
import "qrc:/uibase/qml/talwidget"

Rectangle {
    width: parent.width
    height: Destiny.dp(100)

    property var text: "Title"

    color: "transparent"

    TalText {
        anchors.bottom: parent.bottom
        text: parent.text
        talStyle: TalTextStyle { size: TalTextStyle.Size.TitlePrimary; fontBold: true; }
    }
}
