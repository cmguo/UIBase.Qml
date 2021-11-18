import QtQuick 2.0

Item {

    width: parent.width - navigator.width
    anchors.top: parent.top
    anchors.right: parent.right

    ListView {
        anchors.fill: parent
        anchors.leftMargin: 28
        anchors.topMargin: 14
        spacing: 18
        orientation: Qt.Horizontal
        delegate: Component {
            Loader {
                sourceComponent: component
            }
        }
        model: ListModel { id: items }
    }

    function add(name, component) {
        items.append({name: name, component: component})
    }

    function remove(name) {
        for (var i = 0; i < items.count; ++i) {
            if (items.get(i).name === name) {
                items.remove(i, 1)
                break;
            }
        }
    }

}
