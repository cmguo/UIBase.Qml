import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    property string title: "继续打印"
    property var buttons: [ "开始打印", "取消打印" ]
    property int defaultButton: 0

    property int selectedPlate

    function buttonClicked(index) {
        console.log("buttonClicked " + index)
    }

    width: grid.width
    height: grid.height

    GridView {
        id: grid
        width: cellWidth * 4
        height: cellHeight * 2
        cellWidth: 146
        cellHeight: 146
        model: printManager.task.plates
        delegate: Rectangle {
            width: 128
            height: 128
            radius: 10
            border.width: 3
            border.color: index === selectedPlate ? "#00AE42" : "transparent"
            Image {
                anchors.fill: parent
                anchors.margins: 3
                source: snapshot
            }
            Text {
                anchors.centerIn: parent
                font: Fonts.body_24
                color: "#696969"
                text: done ? "已打印" : ""
            }
            TapHandler {
                gesturePolicy: TapHandler.ReleaseWithinBounds | TapHandler.WithinBounds
                onTapped: { selectedPlate = index }
            }
        }
    }


    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        color: "#40000000"
        text: qsTr("PrintContinue.qml")
    }

}
