import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import TalDisplay 1.0

Rectangle {
    property var dimShow: value
    property var animationDuration: 200

    property var manageQuickWidgetParent: true

    property var dimColor: "#88000000"

    signal showDimStart();
    signal showDimFinish();

    signal closeDimStart();
    signal closeDimFinish();


    // show color
    color: !dimShow ? "#00000000" : dimColor

    Behavior on color {
        PropertyAnimation { duration: animationDuration}
    }


    TalHandler {
        id: dimHandler
    }

    function showDim() {
        dimShow = true
        showDimStart()
        dimHandler.delay(animationDuration, function() {
            showDimFinish()
        })
    }

    function closeDim(){
        dimShow = false
        closeDimStart()
        dimHandler.delay(animationDuration, function() {
            closeDimFinish()
            if(manageQuickWidgetParent) {
                quickWidgetParent.hide();
            }
        })
    }

    function closeDimWithCallback(callback){
        dimShow = false
        closeDimStart()
        dimHandler.delay(animationDuration, function() {
            callback()
            if(manageQuickWidgetParent) {
                quickWidgetParent.hide();
            }
        })
    }
}
