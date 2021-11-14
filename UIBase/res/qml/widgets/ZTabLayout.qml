import QtQuick 2.0
import UIBase 1.0

import "./styles"

Rectangle {

    property int itemWidth: Destiny.dp(96)
    property int animDuration: 300
    property var tabs: ListModel { }

    height: Destiny.dp(36)
    width: tabs.count * itemWidth
    color: "#E2E3E4"
    radius: Destiny.dp(8)
    clip: true

    property int currentSelectedPosition: 0

    signal selectedPositionChanged(int position)

    Rectangle {
        width: itemWidth
        height: parent.height
        color: "#F8F8F8"
        x: currentSelectedPosition * itemWidth
        radius: parent.radius
        border.width: Destiny.dp(2)
        border.color: "#D2D3D4"
        visible: tabs.count > 0

        Behavior on x {
            PropertyAnimation { duration: animDuration}
        }
    }

    ListView {
        id: contentView
        width: parent.width
        height: parent.height
        orientation: ListView.Horizontal
        currentIndex: currentSelectedPosition
        model: tabs
        delegate: Item {
            width: itemWidth
            height: parent.height

            property bool isCurrentItem: {
                return ListView.isCurrentItem
            }

            Behavior on opacity {
                PropertyAnimation { duration: animDuration}
            }

            Image {
                id: itemIcon
                width: Destiny.dp(20)
                height: Destiny.dp(20)
                anchors.left: parent.left
                anchors.leftMargin: Destiny.dp(6)
                anchors.verticalCenter: parent.verticalCenter
                source: icon === "" || icon === undefined ? "" : icon
                visible: icon !== "" && icon !== undefined
            }

            ZText {
                id: itemTitle
                anchors.verticalCenter: parent.verticalCenter
                talStyle: ZTextStyleBlack { size: ZTextStyle.Size.AssistPrimary; level: ZTextStyle.ColorLevel.L100; }
                text: title
                width: itemWidth - itemIcon.width - itemIcon.anchors.leftMargin - itemTitle.anchors.leftMargin
                singleLine: true
                anchors.left: itemIcon.right
                anchors.leftMargin: Destiny.dp(6)
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (contentView.currentIndex != index) {
                        contentView.currentIndex = index
                        currentSelectedPosition = index
                        selectedPositionChanged(index)
                    }
                }
            }
        }
    }
}
