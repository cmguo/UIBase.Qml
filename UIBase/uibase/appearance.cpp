#include "appearance.h"
#include "statecolors.h"

Appearance::Appearance(QObject *parent)
    : QObject(parent)
{
}

void Appearance::init(const char *textColor, const char *backgroundColor, const char *borderColor,
                                     QMap<QByteArray, qreal> const & sizes)
{
    backgroundColor_ = StateColors::inst().get(backgroundColor);
    textColor_ = StateColors::inst().get(textColor);
    borderColor_ = StateColors::inst().get(borderColor);
    set_ = 7;
    auto iter = sizes.begin();
    for (; iter != sizes.end(); ++iter) {
        setProperty(iter.key(), iter.value());
    }
}

void Appearance::init(qreal minHeight, qreal cornerRadius, qreal borderWidth, qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding)
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

void Appearance::setAppearance(Appearance *appearance)
{
    if (appearanece_ == appearance)
        return;
    appearanece_ = appearance;
    update(appearanece_->set_ & ~set_);
}


void Appearance::setTypeAppearance(Appearance *type)
{
    if (type_ == type)
        return;
    type_ = type;
    if (appearanece_ == nullptr)
        update(type->set_ & ~set_);
}

void Appearance::setSizeAppearance(Appearance *size)
{
    if (size_ == size)
        return;
    size_ = size;
    if (appearanece_ == nullptr)
        update(size->set_ & ~set_);
}

void Appearance::setTextColor(StateColor *color)
{
    if (color != textColor_) {
        textColor_ = color;
        updateOne(0);
    }
}

void Appearance::setBackgroundColor(StateColor *color)
{
    if (color != backgroundColor_) {
        backgroundColor_ = color;
        updateOne(1);
    }
}

void Appearance::setBorderColor(StateColor *color)
{
    if (color != borderColor_) {
        borderColor_ = color;
        updateOne(2);
    }
}

void Appearance::setIconColor(StateColor *color)
{
    if (color != iconColor_) {
        iconColor_ = color;
        updateOne(3);
    }
}

void Appearance::setIconPosition(IconPosition position)
{
    if (position != iconPosition_) {
        iconPosition_ = position;
        updateOne(4);
    }
}

void Appearance::setMinHeight(qreal value)
{
    if (value != minHeight_) {
        minHeight_ = value;
        updateOne(5);
    }
}

void Appearance::setCornerRadius(qreal value)
{
    if (((set_ & 1) << 6) == 0 || value != cornerRadius_) {
        cornerRadius_ = value;
        updateOne(6);
    }
}

void Appearance::setBorderWidth(qreal value)
{
    if (((set_ & 1) << 7) == 0 || value != borderWidth_) {
        borderWidth_ = value;
        updateOne(7);
    }
}

void Appearance::setPaddingX(qreal value)
{
    if (((set_ & 1) << 8) == 0 || value != paddingX_) {
        paddingX_ = value;
        updateOne(8);
    }
}

void Appearance::setPaddingY(qreal value)
{
    if (((set_ & 1) << 9) == 0 || value != paddingY_) {
        paddingY_ = value;
        updateOne(9);
    }
}

void Appearance::setTextSize(qreal value)
{
    if (((set_ & 1) << 10) == 0 || value != textSize_) {
        textSize_ = value;
        updateOne(10);
    }
}

void Appearance::setIconSize(qreal value)
{
    if (((set_ & 1) << 11) == 0 || value != iconSize_) {
        iconSize_ = value;
        updateOne(11);
    }
}

void Appearance::setIconPadding(qreal value)
{
    if (((set_ & 1) << 12) == 0 || value != iconPadding_) {
        iconPadding_ = value;
        updateOne(12);
    }
}

void Appearance::updateOne(int item)
{
    item = 1 << item;
    set_ |= item;
    update(item);
}

void Appearance::update(int set)
{
    emit changed(set);
    constexpr void (Appearance::*sigs[])() = {
            &Appearance::textColorChanged,
            &Appearance::backgroundColorChanged,
            &Appearance::borderColorChanged,
            &Appearance::iconColorChanged,
            &Appearance::iconPositionChanged,
            &Appearance::minHeightChanged,
            &Appearance::cornerRadiusChanged,
            &Appearance::borderWidthChanged,
            &Appearance::paddingXChanged,
            &Appearance::paddingYChanged,
            &Appearance::textSizeChanged,
            &Appearance::iconSizeChanged,
            &Appearance::iconPaddingChanged
    };
    int m = 1;
    for (int i = 0; i < 11; ++i) {
        if ((set & m)) {
            (this->*sigs[i])();
        }
        m <<= 1;
    }
}
