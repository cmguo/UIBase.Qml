import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0
//import ZDialog 1.0


import "./"

Item {
    id: root

    property var textContent: "提示"
    property string confirmButtonText:"确定"
    property string cancelButtonText: "取消"
    property bool onlyConfirmButton: false

    property var anchor: 0
    property var anchorX: 0
    property var anchorY: 0
    property var anchorWidth: 0
    property var anchorHeight: 0

    signal confirmClick()
    signal cancelClick()


    onConfirmClick: {
        quickWidgetParent.onConfirmClicked();
    }

    onCancelClick: {
        quickWidgetParent.onCancelClicked();
    }

    function close(){
        anchor = 0
        quickWidgetParent.hide()
    }

    Rectangle {
        id: dialogLayout
        width: internalDialog.width
        height: internalDialog.height
        visible: true
        color: "transparent"

        Behavior on opacity {
            PropertyAnimation { duration: 100}
        }

        x: {
            switch(anchor) {
            case 1:
                return anchorX + (anchorWidth - internalDialog.width)/2
            case 2:
                return anchorX
            case 3:
                return anchorX - internalDialog.width
            case 4:
                return anchorX
            case 5:
                return anchorX - internalDialog.width
            }
            return -1000
        }
        y: {
            switch(anchor) {
            case 1:
                return anchorY + (anchorHeight - internalDialog.height)/2
            case 2:
                return anchorY
            case 3:
                return anchorY
            case 4:
                return anchorY - internalDialog.height
            case 5:
                return anchorY - internalDialog.height
            }
            return -1000
        }

        ZDialogContent {
            id: internalDialog
            visible: visible
        }
    }

}
