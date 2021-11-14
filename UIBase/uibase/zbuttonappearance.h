#ifndef ZBUTTONAPPEARANCE_H
#define ZBUTTONAPPEARANCE_H

#include "statelistcolor.h"

#include <QObject>
#include <array>

class ZButtonAppearance : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ButtonType buttonType READ buttonType WRITE setButtonType)
    Q_PROPERTY(ButtonSize buttonSize READ buttonSize WRITE setButtonSize)
    Q_PROPERTY(ZButtonAppearance* appearance READ appearance WRITE setAppearance)

    Q_PROPERTY(StateListColor* textColor READ textColor WRITE setTextColor NOTIFY textColorChanged)
    Q_PROPERTY(StateListColor* backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    Q_PROPERTY(StateListColor* iconColor READ iconColor WRITE setIconColor NOTIFY iconColorChanged)
    Q_PROPERTY(IconPosition iconPosition READ iconPosition WRITE setIconPosition NOTIFY iconPositionChanged)
    Q_PROPERTY(qreal minHeight READ minHeight WRITE setMinHeight NOTIFY minHeightChanged)
    Q_PROPERTY(qreal cornerRadius READ cornerRadius WRITE setCornerRadius NOTIFY cornerRadiusChanged)
    Q_PROPERTY(qreal paddingX READ paddingX WRITE setPaddingX NOTIFY paddingXChanged)
    Q_PROPERTY(qreal paddingY READ paddingY WRITE setPaddingY NOTIFY paddingYChanged)
    Q_PROPERTY(qreal textSize READ textSize WRITE setTextSize NOTIFY textSizeChanged)
    Q_PROPERTY(qreal iconSize READ iconSize WRITE setIconSize NOTIFY iconSizeChanged)
    Q_PROPERTY(qreal iconPadding READ iconPadding WRITE setIconPadding NOTIFY iconPaddingChanged)

public:
    enum ButtonType {
        Primitive,
        Secondary,
        Tertiary,
        Danger,
        TextLink
    };

    Q_ENUM(ButtonType)

    enum ButtonSize {
        Large,
        Middle,
        Small,
        Thin
    };

    Q_ENUM(ButtonSize)

    enum IconPosition {
        Left,
        Top,
        Right,
        Bottom
    };

    Q_ENUM(IconPosition)

public:
    explicit ZButtonAppearance(QObject *parent = nullptr);

signals:
    void textColorChanged();
    void backgroundColorChanged();
    void iconColorChanged();
    void iconPositionChanged();
    void minHeightChanged();
    void cornerRadiusChanged();
    void paddingXChanged();
    void paddingYChanged();
    void textSizeChanged();
    void iconSizeChanged();
    void iconPaddingChanged();

public:
    ButtonType buttonType() const;
    void setButtonType(ButtonType type);

    ButtonSize buttonSize() const;
    void setButtonSize(ButtonSize size);

    ZButtonAppearance* appearance() const { return appearanece_; }
    void setAppearance(ZButtonAppearance * appearance);

    StateListColor* textColor() const { return get<0>(&ZButtonAppearance::textColor_); }
    void setTextColor(StateListColor* color);

    StateListColor* backgroundColor() const { return get<1>(&ZButtonAppearance::backgroundColor_); }
    void setBackgroundColor(StateListColor* color);

    StateListColor* iconColor() const { return get<2>(&ZButtonAppearance::iconColor_); }
    void setIconColor(StateListColor* color);

    IconPosition iconPosition() const { return get<3>(&ZButtonAppearance::iconPosition_); }
    void setIconPosition(IconPosition position);

    qreal minHeight() const { return get<4>(&ZButtonAppearance::minHeight_); }
    void setMinHeight(qreal value);

    qreal cornerRadius() const { return get<5>(&ZButtonAppearance::cornerRadius_); }
    void setCornerRadius(qreal value);

    qreal paddingX() const { return get<6>(&ZButtonAppearance::paddingX_); }
    void setPaddingX(qreal value);

    qreal paddingY() const { return get<7>(&ZButtonAppearance::paddingY_); }
    void setPaddingY(qreal value);

    qreal textSize() const { return get<8>(&ZButtonAppearance::textSize_); }
    void setTextSize(qreal value);

    qreal iconSize() const { return get<9>(&ZButtonAppearance::iconSize_); }
    void setIconSize(qreal value);

    qreal iconPadding() const { return get<10>(&ZButtonAppearance::iconPadding_); }
    void setIconPadding(qreal value);

signals:
    void changed(int set);

private:
    template<int I, typename T>
    T get(T (ZButtonAppearance::*f)) const {
        for (auto s : std::array<ZButtonAppearance const *, 4> {this, appearanece_, type_, size_}) {
            if (s->set_ & (1 << I)) {
                return s->*f;
            }
        }
        return this->*f;
    }

    void updateOne(int item);

    void update(int set);

private:
    static QMap<ButtonType, ZButtonAppearance*> buttonTypes;
    static QMap<ButtonSize, ZButtonAppearance*> buttonSizes;

private:
    int set_ = 0;
    ZButtonAppearance * appearanece_ = nullptr;
    ZButtonAppearance* type_ = nullptr;
    ZButtonAppearance* size_ = nullptr;
    StateListColor* textColor_ = nullptr;
    StateListColor* backgroundColor_ = nullptr;
    StateListColor* iconColor_ = nullptr;
    IconPosition iconPosition_ = Left;
    qreal minHeight_ = 0;
    qreal cornerRadius_ = 0;
    qreal paddingX_ = 0;
    qreal paddingY_ = 0;
    qreal textSize_ = 0;
    qreal iconSize_ = 0;
    qreal iconPadding_ = 0;
};

#endif // ZBUTTONAPPEARANCE_H
