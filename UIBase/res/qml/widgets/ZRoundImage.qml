import QtQuick 2.0

Canvas {
    id: rootCanvas
    property var imagePath
    property var placeholder

    property var isStartedLoad: false

    onImageLoaded: {
        requestPaint()
    }

    onPaint:  {
        var ctx = getContext("2d")
        ctx.fillStyle = "#00000000"
        if ((imagePath !== undefined || imagePath !== "") && isImageLoaded(imagePath)) {
            ctx.drawImage(imagePath, 0, 0, width, height)
        } else if ((placeholder !== undefined || placeholder !== "") && isImageLoaded(placeholder)) {
             ctx.drawImage(placeholder, 0, 0, width, height)
        }

        ctx.beginPath()

        var r = Math.max(width, height) / 2
        ctx.arc(width / 2, height / 2, r, 0, 2 * Math.PI, true)
        ctx.closePath()
        ctx.clip()

        if (!isStartedLoad) {
            if (imagePath !== undefined || imagePath !== "") {
                loadImage(imagePath)
            }

            if (placeholder !== undefined || placeholder !== "") {
                loadImage(placeholder)
            }
        }
        isStartedLoad = true
    }
}
