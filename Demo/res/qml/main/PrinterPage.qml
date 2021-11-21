import QtQuick 2.12
import ".."

Item {

    BaseTabPage {
        activePage: "Temprature"
        subdir: "printer"
        pages: ListModel {
            ListElement {
                name: "Temprature"
                title: "温度控制"
            }
            ListElement {
                name: "Axis"
                title: "轴偏移"
            }
            ListElement {
                name: "AMS"
                title: "上/下料"
            }
            ListElement {
                name: "Adjust"
                title: "机器校准"
            }
        }
    }

}
