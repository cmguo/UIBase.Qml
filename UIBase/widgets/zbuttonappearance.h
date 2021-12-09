#ifndef ZBUTTONAPPEARANCE_H
#define ZBUTTONAPPEARANCE_H

#include "uibase/statecolor.h"
#include "bamboo/zbuttonappearance.h"

#include <QObject>

#include <array>

class ZButtonAppearance : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Type type READ type WRITE setType)
    Q_PROPERTY(Size size READ size WRITE setSize)
    Q_PROPERTY(ZButtonAppearance* appearance READ appearance WRITE setAppearance)

    Q_PROPERTY(StateColor* textColor READ textColor WRITE setTextColor NOTIFY textColorChanged)
    Q_PROPERTY(StateColor* backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    Q_PROPERTY(StateColor* borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)
    Q_PROPERTY(StateColor* iconColor READ iconColor WRITE setIconColor NOTIFY iconColorChanged)
    Q_PROPERTY(IconPosition iconPosition READ iconPosition WRITE setIconPosition NOTIFY iconPositionChanged)
    Q_PROPERTY(qreal minHeight READ minHeight WRITE setMinHeight NOTIFY minHeightChanged)
    Q_PROPERTY(qreal cornerRadius READ cornerRadius WRITE setCornerRadius NOTIFY cornerRadiusChanged)
    Q_PROPERTY(qreal borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    Q_PROPERTY(qreal paddingX READ paddingX WRITE setPaddingX NOTIFY paddingXChanged)
    Q_PROPERTY(qreal paddingY READ paddingY WRITE setPaddingY NOTIFY paddingYChanged)
    Q_PROPERTY(qreal textSize READ textSize WRITE setTextSize NOTIFY textSizeChanged)
    Q_PROPERTY(qreal iconSize READ iconSize WRITE setIconSize NOTIFY iconSizeChanged)
    Q_PROPERTY(qreal iconPadding READ iconPadding WRITE setIconPadding NOTIFY iconPaddingChanged)

public:
    enum Type {
        BUTTON_TYPES
    };

    Q_ENUM(Type)

    enum Size {
        BUTTON_SIZES
    };

    Q_ENUM(Size)

    enum IconPosition {
        Left,
        Top,
        Right,
        Bottom
    };

    Q_ENUM(IconPosition)

public:
    explicit ZButtonAppearance(QObject *parent = nullptr);

    ZButtonAppearance(char const * textColor, char const * backgroundColor, char const * borderColor = nullptr,
                      QMap<QByteArray, qreal> const & sizes = {});

    ZButtonAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth,
                      qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding);

signals:
    void textColorChanged();
    void backgroundColorChanged();
    void borderColorChanged();
    void iconColorChanged();
    void iconPositionChanged();
    void minHeightChanged();
    void cornerRadiusChanged();
    void borderWidthChanged();
    void paddingXChanged();
    void paddingYChanged();
    void textSizeChanged();
    void iconSizeChanged();
    void iconPaddingChanged();

public:
    Type type() const;
    void setType(Type type);

    Size size() const;
    void setSize(Size size);

    ZButtonAppearance* appearance() const { return appearanece_; }
    void setAppearance(ZButtonAppearance * appearance);

    StateColor* textColor() const { return get<0>(&ZButtonAppearance::textColor_); }
    void setTextColor(StateColor* color);

    StateColor* backgroundColor() const { return get<1>(&ZButtonAppearance::backgroundColor_); }
    void setBackgroundColor(StateColor* color);

    StateColor* borderColor() const { return get<2>(&ZButtonAppearance::borderColor_); }
    void setBorderColor(StateColor* color);

    StateColor* iconColor() const { return get<3>(&ZButtonAppearance::iconColor_); }
    void setIconColor(StateColor* color);

    IconPosition iconPosition() const { return get<4>(&ZButtonAppearance::iconPosition_); }
    void setIconPosition(IconPosition position);

    qreal minHeight() const { return get<5>(&ZButtonAppearance::minHeight_); }
    void setMinHeight(qreal value);

    qreal cornerRadius() const { return get<6>(&ZButtonAppearance::cornerRadius_); }
    void setCornerRadius(qreal value);

    qreal borderWidth() const { return get<7>(&ZButtonAppearance::borderWidth_); }
    void setBorderWidth(qreal value);

    qreal paddingX() const { return get<8>(&ZButtonAppearance::paddingX_); }
    void setPaddingX(qreal value);

    qreal paddingY() const { return get<9>(&ZButtonAppearance::paddingY_); }
    void setPaddingY(qreal value);

    qreal textSize() const { return get<10>(&ZButtonAppearance::textSize_); }
    void setTextSize(qreal value);

    qreal iconSize() const { return get<11>(&ZButtonAppearance::iconSize_); }
    void setIconSize(qreal value);

    qreal iconPadding() const { return get<12>(&ZButtonAppearance::iconPadding_); }
    void setIconPadding(qreal value);

signals:
    void changed(int set);

private:
    template<int I, typename T>
    T get(T (ZButtonAppearance::*f)) const {
        T t = this->*f;
        get<I>(f, &t);
        return t;
    }

    template<int I, typename T>
    bool get(T (ZButtonAppearance::*f), T * t) const {
        if (set_ & 1 << I) {
            *t = this->*f;
            return true;
        }
        for (auto s :{appearanece_, type_, size_}) {
            if (s && s->template get<I>(f, t)) {
                return true;
            }
        }
        return false;
    }

    void updateOne(int item);

    void update(int set);

private:
    static QMap<Type, ZButtonAppearance*> types;
    static QMap<Size, ZButtonAppearance*> sizes;

    static void initEnumAppearance();

private:
    int set_ = 0;
    ZButtonAppearance * appearanece_ = nullptr;
    ZButtonAppearance* type_ = nullptr;
    ZButtonAppearance* size_ = nullptr;
    StateColor* textColor_ = nullptr;
    StateColor* backgroundColor_ = nullptr;
    StateColor* borderColor_ = nullptr;
    StateColor* iconColor_ = nullptr;
    IconPosition iconPosition_ = Left;
    qreal minHeight_ = 0;
    qreal cornerRadius_ = 0;
    qreal borderWidth_ = 0;
    qreal paddingX_ = 0;
    qreal paddingY_ = 0;
    qreal textSize_ = 0;
    qreal iconSize_ = 0;
    qreal iconPadding_ = 0;
};

#endif // ZBUTTONAPPEARANCE_H
