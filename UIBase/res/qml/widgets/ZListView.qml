import QtQuick 2.0

ListView {
    property bool sizeAuto: false
    orientation: ListView.Vertical
    spacing: 0
    clip: true
    width: sizeAuto ? childrenRect.width : parent.width
    height: sizeAuto ? childrenRect.height : parent.width

//    onCountChanged: {
//        if(sizeAuto) {
//            // get QQuickItem which is a root element which hosts delegate items
//            var root = this
//            var value = 0
//            // iterate over each delegate item to get their sizes
//            var max = 0;

//            for (var i = 0; i < root.visibleChildren.length; i++) {
//                if(orientation == ListView.Vertical) {
//                    value += root.visibleChildren[i].height
//                    if(root.visibleChildren[i].width > max) {
//                        max = root.visibleChildren[i].width
//                    }
//                } else if (orientation == ListView.Horizontal) {
//                    value += root.visibleChildren[i].width
//                    if(root.visibleChildren[i].height > max) {
//                        max = root.visibleChildren[i].height
//                    }
//                }
//            }
//            if(orientation == ListView.Vertical) {
//                root.height = value;
//            } else if (orientation == ListView.Horizontal) {
//                root.width = value;
//            }
//        }
//    }
}
