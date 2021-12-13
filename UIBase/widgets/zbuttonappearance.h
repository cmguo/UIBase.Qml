#ifndef ZBUTTONAPPEARANCE_H
#define ZBUTTONAPPEARANCE_H

#include "uibase/appearance.h"
#include "bamboo/zbuttonappearance.h"

#include <QObject>

#include <array>

class ZButtonAppearance : public Appearance
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
    explicit ZButtonAppearance(QObject *parent = nullptr);

    ZButtonAppearance(char const * textColor, char const * backgroundColor, char const * borderColor = nullptr,
                      QMap<QByteArray, qreal> const & sizes = {});

    ZButtonAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth,
                      qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding);

public:
    Type type() const;
    void setType(Type type);

    Size size() const;
    void setSize(Size size);

private:
    static QMap<Type, ZButtonAppearance*> types;
    static QMap<Size, ZButtonAppearance*> sizes;

    static void initEnumAppearance();
};

#endif // ZBUTTONAPPEARANCE_H
