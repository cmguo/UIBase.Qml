#include "zswitchbuttonappearance.h"

QMap<ZSwitchButtonAppearance::Type, ZSwitchButtonAppearance*> ZSwitchButtonAppearance::types;
QMap<ZSwitchButtonAppearance::Size, ZSwitchButtonAppearance*> ZSwitchButtonAppearance::sizes;

ZSwitchButtonAppearance::ZSwitchButtonAppearance(QObject *parent)
    : Appearance(parent)
{
    if (types.empty()) {
        initEnumAppearance();
    }
}

ZSwitchButtonAppearance::ZSwitchButtonAppearance(const char *textColor, const char *backgroundColor, const char *iconColor,
                                     QMap<QByteArray, qreal> const & sizes)
{
    init(textColor, backgroundColor, nullptr, iconColor, sizes);
}

ZSwitchButtonAppearance::ZSwitchButtonAppearance(qreal borderWidth, qreal textSize, qreal iconSize, qreal iconPadding)
{
    init(0, 0, borderWidth, 0, 0, textSize, iconSize, iconPadding);
}

ZSwitchButtonAppearance::Type ZSwitchButtonAppearance::type() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(types.begin(), types.end(), [t = type_](auto v) {
        return v == t;
    }).key();
}

void ZSwitchButtonAppearance::setType(Type type)
{
    setTypeAppearance(types[type]);
}

ZSwitchButtonAppearance::Size ZSwitchButtonAppearance::size() const
{
    if (size_ == nullptr)
        return Large;
    return std::find_if(sizes.begin(), sizes.end(), [s = size_](auto v) {
        return v == s;
    }).key();
}

void ZSwitchButtonAppearance::setSize(Size size)
{
    setSizeAppearance(sizes[size]);
}

