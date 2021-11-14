import QtQuick 2.0
import "qrc:/uibase/qml/talwidget"
import TalDisplay 1.0

TalDimRectangle {
    objectName: "root"
    manageQuickWidgetParent: true

    onShowDimStart: {
        quickWidgetParent.onShowDimStart()
    }

    onShowDimFinish: {
        quickWidgetParent.onShowDimFinish()
    }

    onCloseDimStart: {
        quickWidgetParent.onCloseDimStart()
    }

    onCloseDimFinish: {
        quickWidgetParent.onCloseDimFinish()
    }

}
