import QtQuick 2.12
import ".."

Item {

    BaseTabPage {
        activePage: "Temprature"
        subdir: "printer"
        pages: ListModel {
            ListElement {
                name: "Temprature"
                title: qsTr("Temprature Control")
            }
            ListElement {
                name: "Axis"
                title: qsTr("Axis Offset")
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
