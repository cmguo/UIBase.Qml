#ifndef ZSTEPINDICATOR_H
#define ZSTEPINDICATOR_H

#include <QColor>
#include <QObject>

class ZStepIndicator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QObject* path READ path NOTIFY changed)
    Q_PROPERTY(qreal width MEMBER width_ WRITE setWidth NOTIFY changed)
    Q_PROPERTY(qreal height MEMBER height_ WRITE setHeight NOTIFY changed)
    Q_PROPERTY(int count MEMBER count_ WRITE setCount NOTIFY changed)
    Q_PROPERTY(QColor color MEMBER color_ WRITE setColor NOTIFY changed)

public:
    explicit ZStepIndicator(QObject *parent = nullptr);

public:
    QObject * path() const;

    void setWidth(qreal value);

    void setHeight(qreal value);

    void setCount(int count);

    void setColor(QColor color);

signals:
    void changed();

private:
    qreal width_ = 24;
    qreal height_ = 87;
    int count_ = 0;
    QColor color_;
};

#endif // ZSTEPINDICATOR_H
