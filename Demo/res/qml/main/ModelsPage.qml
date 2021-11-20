import QtQuick 2.12
import UIBase 1.0
import ".."

Item {

    anchors.fill: parent

    BaseTabPage {
        activePage: "All"
        subdir: "printer"
        pages: ListModel {
            ListElement {
                name: "All"
                title: "所有文件"
            }
            ListElement {
                name: "Favorites"
                title: "收藏夹"
            }
            ListElement {
                name: "Borrowed"
                title: "已购买"
            }
            ListElement {
                name: "SDCard"
                title: "SD卡"
            }
        }
        buttonDelegate: ZButton {

        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        font.pointSize: 40
        text: qsTr("ModelsPage.qml")
    }

}
