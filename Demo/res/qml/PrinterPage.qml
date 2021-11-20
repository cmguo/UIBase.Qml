import QtQuick 2.12

Item {

    anchors.fill: parent


    TabBar {
        activePage: "TempraturePage"
        pages: ListModel {
            ListElement {
                name: "TempraturePage"
                title: "温度控制"
            }
            ListElement {
                name: "AxisPage"
                title: "轴偏移"
            }
            ListElement {
                name: "AMSPage"
                title: "上/下料"
            }
            ListElement {
                name: "AdjustPage"
                title: "机器校准"
            }
        }
    }

}
