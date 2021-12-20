#ifndef ZPROGRESSBARAPPEARANCE_H
#define ZPROGRESSBARAPPEARANCE_H

#include "uibase/appearance.h"
#include "bamboo/zprogressbarappearance.h"

#include <QObject>

class ZProgressBarAppearance : public Appearance
{
    Q_OBJECT

    Q_PROPERTY(Type type READ type WRITE setType)
    Q_PROPERTY(Size size READ size WRITE setSize)

public:
    enum Type {
        PROGRESS_BAR_TYPES
    };

    Q_ENUM(Type)

    enum Size {
        PROGRESS_BAR_SIZES
    };

    Q_ENUM(Size)

public:
    explicit ZProgressBarAppearance(QObject *parent = nullptr);

    ZProgressBarAppearance(char const * textColor, char const * backgroundColor, char const * iconColor = nullptr,
                      QMap<QByteArray, qreal> const & sizes = {});

    ZProgressBarAppearance(qreal borderWidth, qreal cornerRadius, qreal textSize, qreal iconSize);

public:
    Type type() const;
    void setType(Type type);

    Size size() const;
    void setSize(Size size);

private:
    static QMap<Type, ZProgressBarAppearance*> types;
    static QMap<Size, ZProgressBarAppearance*> sizes;

    static void initEnumAppearance();
};

#endif // ZPROGRESSBARAPPEARANCE_H
