/**********************************************************
Author: Qtbig哥
WeChat Official Accounts Platform: nicaixiaoxuesheng (文章首发)
Website: qtbig.com(后续更新)
Email:  2088201923@qq.com
QQ交流群: 732271126
LISCENSE: MIT
**********************************************************/
import QtQuick 2.0

Rectangle {
    id: root
    property int radiusCorners: Qt.AlignLeft | Qt.AlignRight | Qt.AlignTop | Qt.AlignBottom /* Default: */
    /*
                            Qt.AlignLeft |      Qt.AlignLeft |      Qt.AlignRight |     Qt.AlignLeft |      Qt.AlignLeft |
                            Qt.AlignRight |     Qt.AlignTop |       Qt.AlignTop |       Qt.AlignRight |     Qt.AlignRight |
              None:0        Qt.AlignTop |       Qt.AlignBottom      Qt.AlignBottom      Qt.AlignTop         Qt.AlignBottom
                            Qt.AlignBottom
        *****************     *************       ***************   ***************       *************     *****************
        *               *    *             *     *              *   *              *     *             *    *               *
        *               *   *               *   *               *   *               *   *               *   *               *
        *               *   *               *   *               *   *               *   *               *   *               *
        *               *   *               *   *               *   *               *   *               *   *               *
        *               *   *               *   *               *   *               *   *               *   *               *
        *               *   *               *   *               *   *               *   *               *   *               *
        *               *    *             *     *              *   *              *    *               *    *             *
        *****************     *************       ***************   ***************     *****************     *************
    */

    border.width: 0

    Repeater {
        model: [ {
                x: 0,
                y: 0,
                visible: internal.aligns(Qt.AlignLeft | Qt.AlignTop),
                radius: root.radius
            },
            {
                x: root.width - root.radius * 2,
                y: 0,
                visible: internal.aligns(Qt.AlignRight | Qt.AlignTop),
                radius: root.radius
            },
            {
                x: 0,
                y: root.height - root.radius * 2,
                visible: internal.aligns(Qt.AlignLeft | Qt.AlignBottom),
                radius: root.radius
            },
            {
                x: root.width - root.radius* 2,
                y: root.height - root.radius * 2,
                visible: internal.aligns(Qt.AlignRight | Qt.AlignBottom),
                radius: root.radius
            } ]

        Rectangle {
            x: modelData.x; y: modelData.y
            width: modelData.radius * 2; height: width
            visible: !modelData.visible
            color: root.color
            border.width: root.border.width
            border.color: root.border.color

            Rectangle {
                x: (index == 0 || index == 2) ? (0 + parent.border.width) : (0 - parent.border.width)
                y: (index == 0 || index == 1) ? (0 + parent.border.width) : (0 - parent.border.width)
                width: parent.width;
                height: parent.height
                visible: parent.visible
                color: parent.color
            }

        }
    }

    QtObject {
        id: internal

        function aligns(direction) {
            return (root.radiusCorners & direction) === direction
        }
    }
}
