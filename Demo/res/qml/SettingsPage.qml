import QtQuick 2.12
import UIBase 1.0

Item {

    anchors.fill: parent

    TabBar {
        activePage: "UserPage"
        pages: ListModel {
            ListElement {
                name: "UserPage"
                title: "个人账号"
            }
            ListElement {
                name: "DevicePage"
                title: "本机设置"
            }
            ListElement {
                name: "NetworkPage"
                title: "网络设置"
            }
            ListElement {
                name: "RecorderPage"
                title: "录像设置"
            }
            ListElement {
                name: "LanguagePage"
                title: "语言设置"
            }
        }
    }

}
