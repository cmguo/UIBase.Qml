import QtQuick 2.12
import QtQuick.Controls 2.5
import TalDisplay 1.0



MouseArea {
    readonly property int stateIdle: 0
    readonly property int stateHovered: 1
    readonly property int statePressed: 2

    property var watchMode: false
    property var state: stateIdle
    property var enableLog: false

    readonly property bool isHovered: state === stateHovered

    hoverEnabled: true

    onEntered: {
        if(enableLog) console.info("onEntered")
        state = stateHovered
    }

    onPressed: {
        if(enableLog) console.info("onPressed")
        state = statePressed
        if(watchMode) {
            mouse.accepted = false
        }
    }

    onExited: {
        if(enableLog) console.info("onExited")
        state = stateIdle
    }

    onReleased: {
        if(enableLog) console.info("onReleased")
        if(watchMode) {
            mouse.accepted = false
        }
    }

    onCanceled: {
        state = stateIdle
        if(enableLog) console.info("onCanceled")
    }

    onPressAndHold: {
        if(enableLog) console.info("onPressAndHold")
    }

    onClicked: {
        if(enableLog) console.info("onClicked")
        state = stateIdle
        if(watchMode) {
            mouse.accepted = false
        }
    }

    onDoubleClicked: {
        if(enableLog) console.info("onDoubleClicked")
        state = stateIdle
    }

    //    onMouseXChanged: {
    //        if(enableLog) console.info("onMouseXChanged -> " + mouseX)
    //    }

    //    onMouseYChanged: {
    //        if(enableLog) console.info("onMouseYChanged -> " + mouseY)
    //    }

    onContainsMouseChanged: {
        if(enableLog) console.info("onContainsMouseChanged -> " + containsMouse)
    }


    onFocusChanged: {
        if(enableLog) console.info("onFocusChanged -> " + focus)
    }

}
