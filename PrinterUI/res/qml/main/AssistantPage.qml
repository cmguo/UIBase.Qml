import QtQuick 2.12

Item {

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("AssistantPage.qml")
    }

    TapHandler {
        onTapped: {
            Qt.quit()
        }
    }

}
