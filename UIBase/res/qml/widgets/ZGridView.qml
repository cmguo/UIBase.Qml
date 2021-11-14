import QtQuick 2.12
import QtQuick.Controls 2.5

GridView {

    signal gridViewItemClicked(var index, var modelData)

    property var columnCount: 3
    property var horizontalSpacing: 0
    property var verticalSpacing: 0
    property var contentCellWidth: (width - horizontalSpacing * (columnCount + 1))/columnCount
    property var contentCellHeight: 0

    property Component contentDelegate

    property GridView thisGridView: this

    anchors.fill: parent
    clip: true
    cellWidth: contentCellWidth + horizontalSpacing
    cellHeight: contentCellHeight + verticalSpacing

    // Demo illustrate how to use custom settings.
    delegate: Rectangle {
        id: internalDelegate
        width: cellWidth
        height: cellHeight
        //        color: index % 2 == 0 ? "pink" : "yellow"
        color: "transparent"

        Rectangle {
            property int internalTempIndex: index
            property variant internalTempModel: model

            id: internalDelegateContent
            x: horizontalSpacing
            y: verticalSpacing
            width: contentCellWidth
            height: contentCellHeight
            color: "transparent"
            Loader {
                id: internalContentDelegateLoader
                anchors.fill: parent
                property int index: internalDelegateContent.internalTempIndex
                property variant model: internalDelegateContent.internalTempModel
                property variant modelData: model.modelData

                sourceComponent: contentDelegate
            }

            MouseArea {
                anchors.fill: internalDelegateContent
                onClicked: {
                    console.info("Fish#Debug onClicked " + index)
                    thisGridView.currentIndex = index
                    gridViewItemClicked(index, modelData)
                }
            }
        }

    }

    highlight:  Rectangle {
        width: cellWidth
        height: cellHeight
        color: "lightsteelblue"

        Rectangle {
            x: horizontalSpacing
            y: verticalSpacing
            width: contentCellWidth
            height: contentCellHeight
            color: "#988942"
        }
    }
    highlightFollowsCurrentItem: true

    ScrollBar.vertical: ScrollBar { }

    footer: Item {
        width: parent.width
        height: verticalSpacing
    }

}
