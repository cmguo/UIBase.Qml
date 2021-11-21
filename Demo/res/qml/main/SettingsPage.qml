import QtQuick 2.12
import UIBase 1.0
import ".."

Item {

    BaseTabPage {
        activePage: "User"
        subdir: "settings"
        pages: ListModel {
            ListElement {
                name: "User"
                title: "个人账号"
            }
            ListElement {
                name: "Device"
                title: "本机设置"
            }
            ListElement {
                name: "Network"
                title: "网络设置"
            }
            ListElement {
                name: "Recorder"
                title: "录像设置"
            }
            ListElement {
                name: "Language"
                title: "语言设置"
            }
        }
    }

}
