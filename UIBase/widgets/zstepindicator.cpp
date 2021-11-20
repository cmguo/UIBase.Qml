#include "zstepindicator.h"

#include <QPainterPath>
#include <QQmlComponent>
#include <QtMath>

ZStepIndicator::ZStepIndicator(QObject *parent)
    : QObject(parent)
{
}

static QObject * createObject(QObject const *context, const char *className, const char *module, const char *version)
{
    if (module == nullptr) {
        module = "QtQuick";
        version = "2.0";
    } else if (version == nullptr) {
        version = "1.0";
    }
    QByteArray qml = QByteArray("import ") + module + " " + version + "; "
            + className + " {}";
    QQmlComponent qc(qmlEngine(context));
    qc.setData(qml, QUrl("qrc:"));
    if (!qc.isReady())
        qWarning() << "QuickHelper::createObject" << qml << qc.errorString();
    return qc.create();
}

static void appendChild(QObject *parent, QObject *child)
{
    int idef = parent->metaObject()->indexOfClassInfo("DefaultProperty");
    if (idef >= 0) {
        char const * def = parent->metaObject()->classInfo(idef).value();
        QQmlListReference data(parent, def, qmlEngine(parent));
        if (data.isValid())
            data.append(child);
    }
}

static void addPath(QObject * path, const QPainterPath &ph)
{
    QObject * seg = nullptr;
    constexpr char const * classNames[] = {"PathMove", "PathLine", "PathCubic"};
    for (int i = 0; i < ph.elementCount(); ++i) {
        QPainterPath::Element e = ph.elementAt(i);
        switch (e.type) {
        case QPainterPath::MoveToElement:
            if (i == 0) {
                path->setProperty("startX", e.x);
                path->setProperty("startY", e.y);
                break;
            }
        case QPainterPath::LineToElement:
            seg = createObject(path, classNames[e.type], "QtQuick", "2.12");
            seg->setProperty("x", e.x);
            seg->setProperty("y", e.y);
            break;
        case QPainterPath::CurveToElement:
            if (i + 2 < ph.elementCount()) {
                seg = createObject(path, classNames[e.type], "QtQuick", "2.12");
                seg->setProperty("control1X", e.x);
                seg->setProperty("control1Y", e.y);
                QPainterPath::Element e1 = ph.elementAt(++i);
                QPainterPath::Element e2 = ph.elementAt(++i);
                seg->setProperty("control2X", e1.x);
                seg->setProperty("control2Y", e1.y);
                seg->setProperty("x", e2.x);
                seg->setProperty("y", e2.y);
            }
            break;
        default:
            break;
        }
        if (seg)
            appendChild(path, seg);
        seg = nullptr;
    }
}


QObject *ZStepIndicator::path() const
{
    qreal radius = width_ / 2;
    qreal width2 = width_ / 16; // half stick width
    qreal radius2 = radius / 2;
    qreal degree = acos((width2 + radius2) / (radius + radius2));
    qreal height2 = sqrt((radius + radius2) * (radius + radius2) - (width2 + radius2) * (width2 + radius2));
    degree = degree * 180 / M_PI;

    QPainterPath ph;
    QRectF rect{0, 0, radius * 2, radius * 2};
    QRectF rect2{radius + width2, 0, radius2 * 2, radius2 * 2};
    ph.moveTo(0, radius);
    ph.arcTo(rect, 180, -180);
    for (int i = 0; i < count_; ++i) {
        rect2.moveCenter({rect2.center().x(), rect.center().y() + height2});
        ph.arcTo(rect, 0, -degree);
        ph.arcTo(rect2, -degree + 180, degree);
        rect.translate(0, height_);
        rect2.moveCenter({rect2.center().x(), rect.center().y() - height2});
        ph.lineTo(rect2.x(), rect2.center().y());
        ph.arcTo(rect2, 180, degree);
        ph.arcTo(rect, degree, -degree);
    }
    ph.arcTo(rect, 0, -180);
    rect2.translate({(radius2 + width2) * -2, 0});
    for (int i = 0; i < count_; ++i) {
        rect2.moveCenter({rect2.center().x(), rect.center().y() - height2});
        ph.arcTo(rect, 180, -degree);
        ph.arcTo(rect2, -degree, degree);
        rect.translate(0, -height_);
        rect2.moveCenter({rect2.center().x(), rect.center().y() + height2});
        ph.lineTo(radius - width2, rect2.center().y());
        ph.arcTo(rect2, 0, degree);
        ph.arcTo(rect, 180 + degree, -degree);
    }
    ph.closeSubpath();
    QObject * path = createObject(this, "ShapePath", "QtQuick.Shapes", "1.12");
    path->setProperty("closed", true);
    path->setProperty("fillColor", color_);
    path->setProperty("strokeColor", "transparent");
    addPath(path, ph);
    return path;
}

void ZStepIndicator::setWidth(qreal value)
{
    width_ = value;
    emit changed();
}

void ZStepIndicator::setHeight(qreal value)
{
    height_ = value;
    emit changed();
}

void ZStepIndicator::setCount(int count)
{
    count_ = count;
    emit changed();
}

void ZStepIndicator::setColor(QColor color)
{
    color_ = color;
    emit changed();
}
