import QtQuick 2.12
import UIBase 1.0
import "qrc:/uibase/qml/widgets"

Item {

    signal modelClicked(string model)

    GridView {
        id: grid
        anchors.fill: parent
        anchors.leftMargin: 36
        cellWidth: 360
        cellHeight: 304
        model: modelsManager.models ? modelsManager.models : fakeModels
        delegate: Rectangle {
            width: 346
            height: 286
            radius: 20
            color: Colors.lightbg2

            Image {
                x: 51; y: 44
                width: 236
                height: 155
                source: imageUrl
            }

            ZText {
                x: 39
                y: 208
                height: 30
                font: Fonts.body_24
                text: title
            }

            ZText {
                x: 39
                y: 237
                height: 30
                font: Fonts.body_16
                text: detail
            }

            TapHandler {
                onTapped: {
                    modelClicked(name)
                }
            }
        }
    }

    ZText {
        id: errMsg
        anchors.centerIn: parent
        font: Fonts.body_38
        text: modelsManager.errorString
    }

    AnimatedImage {
        id: loading
        anchors.centerIn: parent
        source: "qrc:/uibase/icon/progress_loading.gif"
        visible: modelsManager.loading
    }

    ListModel {
        id: fakeModels
        ListElement {
            name: "model1"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "Robort"
            detail: "1小时前-收藏夹"
        }
        ListElement {
            name: "model2"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "cow_color"
            detail: "1天前-SD卡"
        }
        ListElement {
            name: "model3"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "Robort"
            detail: "1小时前-收藏夹"
        }
        ListElement {
            name: "model4"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "Robort"
            detail: "1小时前-收藏夹"
        }
        ListElement {
            name: "model5"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "Robort"
            detail: "1小时前-收藏夹"
        }
        ListElement {
            name: "model6"
            imageUrl: "qrc:/uibase/icon/fish_test.jpg"
            title: "Robort"
            detail: "1小时前-SD卡"
        }
    }

    Text {
        id: desc
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 90
        font.pointSize: 40
        text: qsTr("ModelListPage.qml")
    }
}
