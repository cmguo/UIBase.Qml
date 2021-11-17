#include "zbuttonappearance.h"
#include "uibase/statelistcolors.h"

#include <QMap>

QMap<ZButtonAppearance::ButtonType, ZButtonAppearance*> ZButtonAppearance::buttonTypes;
QMap<ZButtonAppearance::ButtonSize, ZButtonAppearance*> ZButtonAppearance::buttonSizes;

ZButtonAppearance::ZButtonAppearance(QObject *parent)
    : QObject(parent)
{
    if (buttonTypes.empty()) {
        buttonTypes.insert(Primitive, new ZButtonAppearance(
                               "static_bluegrey_900_disabled", "brand_500_pressed_disabled"));
        buttonTypes.insert(Secondary, new ZButtonAppearance(
                               "blue_600_disabled", "blue_100_pressed_disabled"));
        buttonTypes.insert(Tertiary, new ZButtonAppearance(
                               "bluegrey_800_disabled", "bluegrey_100_pressed_disabled"));
        buttonTypes.insert(Danger, new ZButtonAppearance(
                               "red_600_disabled", "red_100_pressed_disabled"));
        buttonTypes.insert(TextLink, new ZButtonAppearance(
                               "blue_600_disabled", "transparent_pressed_disabled"));

        buttonSizes.insert(Large, new ZButtonAppearance(
                               44, 24, 0, 32, 0, 18, 20, 5));
        buttonSizes.insert(Middle, new ZButtonAppearance(
                               36, 18, 0, 24, 0, 16, 18, 4));
        buttonSizes.insert(Small, new ZButtonAppearance(
                               24, 12, 0, 12, 0, 14, 16, 3));
        buttonSizes.insert(Thin, new ZButtonAppearance(
                               20, 10, 0, 12, 0, 14, 16, 2));
    }
}

ZButtonAppearance::ZButtonAppearance(const char *textColor, const char *backgroundColor, const char *borderColor)
{
    backgroundColor_ = StateListColors::inst().get(backgroundColor);
    textColor_ = StateListColors::inst().get(textColor);
    borderColor_ = StateListColors::inst().get(borderColor);
    set_ = 7;
}

ZButtonAppearance::ZButtonAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth, qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding)
{
    minHeight_ = minHeight;
    cornerRadius_ = cornerRadius;
    borderWidth_ = borderWidth;
    paddingX_ = paddingX;
    paddingY_ = paddingY;
    textSize_ = textSize;
    iconSize_ = iconSize;
    iconPadding_ = iconPadding;
    set_ = 0xff << 5;
}

ZButtonAppearance::ButtonType ZButtonAppearance::buttonType() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(buttonTypes.begin(), buttonTypes.end(), [t = type_](auto v) {
        return v == t;
    }).key();
}

void ZButtonAppearance::setButtonType(ButtonType type)
{
    auto t = buttonTypes[type];
    if (type_ == t)
        return;
    type_ = t;
    if (appearanece_ == nullptr)
        update(t->set_ & ~set_);
}

ZButtonAppearance::ButtonSize ZButtonAppearance::buttonSize() const
{
    if (size_ == nullptr)
        return Large;
    return std::find_if(buttonSizes.begin(), buttonSizes.end(), [s = size_](auto v) {
        return v == s;
    }).key();
}

void ZButtonAppearance::setButtonSize(ButtonSize size)
{
    auto s = buttonSizes[size];
    if (size_ == s)
        return;
    size_ = s;
    if (appearanece_ == nullptr)
        update(s->set_ & ~set_);
}

void ZButtonAppearance::setAppearance(ZButtonAppearance *appearance)
{
    if (appearanece_ == appearance)
        return;
    appearanece_ = appearance;
    update(appearanece_->set_ & ~set_);
}

void ZButtonAppearance::setTextColor(StateListColor *color)
{
    if (color != textColor_) {
        textColor_ = color;
        updateOne(0);
    }
}

void ZButtonAppearance::setBackgroundColor(StateListColor *color)
{
    if (color != backgroundColor_) {
        backgroundColor_ = color;
        updateOne(1);
    }
}

void ZButtonAppearance::setBorderColor(StateListColor *color)
{
    if (color != borderColor_) {
        borderColor_ = color;
        updateOne(2);
    }
}

void ZButtonAppearance::setIconColor(StateListColor *color)
{
    if (color != iconColor_) {
        iconColor_ = color;
        updateOne(3);
    }
}

void ZButtonAppearance::setIconPosition(IconPosition position)
{
    if (position != iconPosition_) {
        iconPosition_ = position;
        updateOne(4);
    }
}

void ZButtonAppearance::setMinHeight(qreal value)
{
    if (value != minHeight_) {
        minHeight_ = value;
        updateOne(5);
    }
}

void ZButtonAppearance::setCornerRadius(qreal value)
{
    if (((set_ & 1) << 6) == 0 || value != cornerRadius_) {
        cornerRadius_ = value;
        updateOne(6);
    }
}

void ZButtonAppearance::setBorderWidth(qreal value)
{
    if (((set_ & 1) << 7) == 0 || value != borderWidth_) {
        borderWidth_ = value;
        updateOne(7);
    }
}

void ZButtonAppearance::setPaddingX(qreal value)
{
    if (((set_ & 1) << 8) == 0 || value != paddingX_) {
        paddingX_ = value;
        updateOne(8);
    }
}

void ZButtonAppearance::setPaddingY(qreal value)
{
    if (((set_ & 1) << 9) == 0 || value != paddingY_) {
        paddingY_ = value;
        updateOne(9);
    }
}

void ZButtonAppearance::setTextSize(qreal value)
{
    if (((set_ & 1) << 10) == 0 || value != textSize_) {
        textSize_ = value;
        updateOne(10);
    }
}

void ZButtonAppearance::setIconSize(qreal value)
{
    if (((set_ & 1) << 11) == 0 || value != iconSize_) {
        iconSize_ = value;
        updateOne(11);
    }
}

void ZButtonAppearance::setIconPadding(qreal value)
{
    if (((set_ & 1) << 12) == 0 || value != iconPadding_) {
        iconPadding_ = value;
        updateOne(12);
    }
}

void ZButtonAppearance::updateOne(int item)
{
    item = 1 << item;
    set_ |= item;
    update(item);
}

void ZButtonAppearance::update(int set)
{
    emit changed(set);
    constexpr void (ZButtonAppearance::*sigs[])() = {
            &ZButtonAppearance::textColorChanged,
            &ZButtonAppearance::backgroundColorChanged,
            &ZButtonAppearance::borderColorChanged,
            &ZButtonAppearance::iconColorChanged,
            &ZButtonAppearance::iconPositionChanged,
            &ZButtonAppearance::minHeightChanged,
            &ZButtonAppearance::cornerRadiusChanged,
            &ZButtonAppearance::borderWidthChanged,
            &ZButtonAppearance::paddingXChanged,
            &ZButtonAppearance::paddingYChanged,
            &ZButtonAppearance::textSizeChanged,
            &ZButtonAppearance::iconSizeChanged,
            &ZButtonAppearance::iconPaddingChanged
    };
    int m = 1;
    for (int i = 0; i < 11; ++i) {
        if ((set & m)) {
            (this->*sigs[i])();
        }
        m <<= 1;
    }
}
