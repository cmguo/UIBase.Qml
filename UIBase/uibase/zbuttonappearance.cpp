#include "zbuttonappearance.h"

#include <QMap>

QMap<ZButtonAppearance::ButtonType, ZButtonAppearance*> ZButtonAppearance::buttonTypes;
QMap<ZButtonAppearance::ButtonSize, ZButtonAppearance*> ZButtonAppearance::buttonSizes;

ZButtonAppearance::ZButtonAppearance(QObject *parent)
    : QObject(parent)
{
}

ZButtonAppearance::ButtonType ZButtonAppearance::buttonType() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(buttonTypes.keyValueBegin(), buttonTypes.keyValueEnd(), [t = type_](auto v) {
        return v.second == t;
    })->first;
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
    return std::find_if(buttonSizes.keyValueBegin(), buttonSizes.keyValueEnd(), [s = size_](auto v) {
        return v.second == s;
    })->first;
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

void ZButtonAppearance::setIconColor(StateListColor *color)
{
    if (color != iconColor_) {
        iconColor_ = color;
        updateOne(2);
    }
}

void ZButtonAppearance::setIconPosition(IconPosition position)
{
    if (position != iconPosition_) {
        iconPosition_ = position;
        updateOne(3);
    }
}

void ZButtonAppearance::setMinHeight(qreal value)
{
    if (value != minHeight_) {
        minHeight_ = value;
        updateOne(4);
    }
}

void ZButtonAppearance::setCornerRadius(qreal value)
{
    if (value != cornerRadius_) {
        cornerRadius_ = value;
        updateOne(5);
    }
}

void ZButtonAppearance::setPaddingX(qreal value)
{
    if (value != paddingX_) {
        paddingX_ = value;
        updateOne(6);
    }
}

void ZButtonAppearance::setPaddingY(qreal value)
{
    if (value != paddingY_) {
        paddingY_ = value;
        updateOne(7);
    }
}

void ZButtonAppearance::setTextSize(qreal value)
{
    if (value != paddingY_) {
        paddingY_ = value;
        updateOne(8);
    }
}

void ZButtonAppearance::setIconSize(qreal value)
{
    if (value != iconSize_) {
        iconSize_ = value;
        updateOne(9);
    }
}

void ZButtonAppearance::setIconPadding(qreal value)
{
    if (value != iconPadding_) {
        iconPadding_ = value;
        updateOne(10);
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
    changed(set);
    constexpr void (ZButtonAppearance::*sigs[])() = {
            &ZButtonAppearance::textColorChanged,
            &ZButtonAppearance::backgroundColorChanged,
            &ZButtonAppearance::iconColorChanged,
            &ZButtonAppearance::iconPositionChanged,
            &ZButtonAppearance::minHeightChanged,
            &ZButtonAppearance::cornerRadiusChanged,
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
