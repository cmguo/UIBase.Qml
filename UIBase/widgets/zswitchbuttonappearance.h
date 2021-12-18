#ifndef ZSWITCHBUTTONAPPEARANCE_H
#define ZSWITCHBUTTONAPPEARANCE_H

#include <uibase/appearance.h>
#include "bamboo/zswitchbuttonappearance.h"

#include <QMap>
#include <QObject>

class ZSwitchButtonAppearance : public Appearance
{
    Q_OBJECT

    Q_PROPERTY(Type type READ type WRITE setType)
    Q_PROPERTY(Size size READ size WRITE setSize)

public:
    enum Type {
        BUTTON_TYPES
    };

    Q_ENUM(Type)

    enum Size {
        BUTTON_SIZES
    };

    Q_ENUM(Size)

public:
    explicit ZSwitchButtonAppearance(QObject *parent = nullptr);

    ZSwitchButtonAppearance(char const * textColor, char const * backgroundColor, char const * iconColor = nullptr,
                      QMap<QByteArray, qreal> const & sizes = {});

    ZSwitchButtonAppearance(qreal borderWidth, qreal textSize, qreal iconSize, qreal iconPadding);

public:
    Type type() const;
    void setType(Type type);

    Size size() const;
    void setSize(Size size);

private:
    static QMap<Type, ZSwitchButtonAppearance*> types;
    static QMap<Size, ZSwitchButtonAppearance*> sizes;

    static void initEnumAppearance();
};

#endif // ZSWITCHBUTTONAPPEARANCE_H
