#ifndef ZTEXTINPUTAPPEARANCE_H
#define ZTEXTINPUTAPPEARANCE_H

#include "uibase/appearance.h"
#include "bamboo/ztextinputappearance.h"

#include <QObject>

#include <array>

class ZTextInputAppearance : public Appearance
{
    Q_OBJECT

    Q_PROPERTY(Type type READ type WRITE setType)
    Q_PROPERTY(Size size READ size WRITE setSize)

public:
    enum Type {
        TEXT_INPUT_TYPES
    };

    Q_ENUM(Type)

    enum Size {
        TEXT_INPUT_SIZES
    };

    Q_ENUM(Size)

public:
    explicit ZTextInputAppearance(QObject *parent = nullptr);

    ZTextInputAppearance(char const * textColor, char const * backgroundColor, char const * borderColor = nullptr,
                      QMap<QByteArray, qreal> const & sizes = {});

    ZTextInputAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth,
                      qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding);

public:
    Type type() const;
    void setType(Type type);

    Size size() const;
    void setSize(Size size);

private:
    static QMap<Type, ZTextInputAppearance*> types;
    static QMap<Size, ZTextInputAppearance*> sizes;

    static void initEnumAppearance();
};

#endif // ZTEXTINPUTAPPEARANCE_H
