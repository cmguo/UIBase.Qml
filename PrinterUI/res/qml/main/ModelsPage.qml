import QtQuick 2.12
import QtQuick.Controls 2.12
import UIBase 1.0
import ".."
import "../models"
import "qrc:/uibase/qml/widgets"

Item {

    BaseTabPage {
        id: tab
        barHeight: 60
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
        pageHandler: QtObject {
            function handle() {
                modelsManager.load(tab.activePage)
                if (stack && stack.depth == 2)
                    stack.pop();
            }
        }
    }

    property var modelsManager: QtObject {
        property var models
        property bool loading
        property string errorString

        function load(page) {
            if (page == "SDCard") {
                modelsManager.errorString = "未插入SD卡"
                modelsManager.models = ({})
            } else if (page == "Borrowed") {
                modelsManager.errorString = "无"
                modelsManager.models = ({})
            } else if (page == "Favorites") {
                modelsManager.models = ({})
                modelsManager.errorString = ""
            } else {
                modelsManager.models = null
                modelsManager.errorString = ""
            }

            modelsManager.loading = page === "Favorites"
        }

        function getDetail(name) {
            return {
                name: "model4",
                imageUrl: "qrc:/uibase/icon/fish_test.jpg",
                title: "Robort",
                detail: "1小时前-收藏夹"
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        anchors.topMargin: tab.height

        initialItem: list
    }

    Component {
        id: list

        ModelListPage {
            onModelClicked: {
                stack.push(detail, {model: modelsManager.getDetail(model)})
            }
        }
    }

    Component {
        id: detail

        ModelDetailPage {
        }
    }

}
