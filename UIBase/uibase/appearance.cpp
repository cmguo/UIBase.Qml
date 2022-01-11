#include "appearance.h"
#include "statecolors.h"

Appearance::Appearance(QObject *parent)
    : QObject(parent)
{
}

void Appearance::init(const char *textColor, const char *backgroundColor, const char *borderColor, const char *iconColor, const QMap<QByteArray, qreal> &sizes)
{
    backgroundColor_ = StateColors::inst().get(backgroundColor);
    textColor_ = StateColors::inst().get(textColor);
    borderColor_ = StateColors::inst().get(borderColor);
    iconColor_ = StateColors::inst().get(iconColor);
    set_ = 15;
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

void Appearance::take(QObject *obj)
{
    if (obj && obj->parent() == nullptr)
        obj->setParent(this);
}

void Appearance::free(QObject *obj)
{
    if (obj && obj->parent() == this)
        obj->setParent(nullptr);
}
