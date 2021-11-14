import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import UIBase 1.0


import "./"
import ZDialog 1.0

Popup {
    id: root

    property var textContent: "提示"
    property string confirmButtonText:"确定"
    property string cancelButtonText: "取消"
    property bool onlyConfirmButton: false

    signal confirmClick()
    signal cancelClick()

    property var confirmCallback: ""
    property var cancelCallback: ""

    onConfirmClick: {
        if(confirmCallback != "") {
            confirmCallback()
        } else {
            close()
        }
    }

    onCancelClick: {
        if(cancelCallback != "") {
            cancelCallback()
        } else {
            close()
        }
    }

//    onClosed: {
//        confirmCallback = ""
//        cancelCallback = ""
//        textContent = ""
//        confirmButtonText = ""
//        cancelButtonText = ""
//        onlyConfirmButton = false
//    }

    modal: true
    focus: true
    dim: true

    visible: false

    background: Rectangle {
        color: "transparent"
    }

    width: leftPadding+rightPadding + content.width
    height: topPadding + bottomPadding + content.height

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    ZDialogContent {
        id: content
    }

    function showDialog(content, confirmText, cancelText, confirmCallback, cancelCallback) {
        root.textContent = content
        root.confirmButtonText = confirmText
        root.cancelButtonText = cancelText
        root.confirmCallback = confirmCallback
        root.cancelCallback = cancelCallback
        open()
    }

}

