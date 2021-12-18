#include "zprogressbarappearance.h"

QMap<ZProgressBarAppearance::Type, ZProgressBarAppearance*> ZProgressBarAppearance::types;
QMap<ZProgressBarAppearance::Size, ZProgressBarAppearance*> ZProgressBarAppearance::sizes;

ZProgressBarAppearance::ZProgressBarAppearance(QObject *parent)
    : Appearance(parent)
{
    if (types.empty()) {
        initEnumAppearance();
    }
}

ZProgressBarAppearance::ZProgressBarAppearance(const char *textColor, const char *backgroundColor, const char *iconColor,
                                     QMap<QByteArray, qreal> const & sizes)
{
    init(textColor, backgroundColor, nullptr, iconColor, sizes);
}

ZProgressBarAppearance::ZProgressBarAppearance(qreal borderWidth, qreal cornerRadius, qreal textSize, qreal iconSize)
{
    init(0, cornerRadius, borderWidth, 0, 0, textSize, iconSize, 0);
}

ZProgressBarAppearance::Type ZProgressBarAppearance::type() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(types.begin(), types.end(), [t = type_](auto v) {
        return v == t;
    }).key();
}

void ZProgressBarAppearance::setType(Type type)
{
    setTypeAppearance(types[type]);
}

ZProgressBarAppearance::Size ZProgressBarAppearance::size() const
{
    if (size_ == nullptr)
        return Large;
    return std::find_if(sizes.begin(), sizes.end(), [s = size_](auto v) {
        return v == s;
    }).key();
}

void ZProgressBarAppearance::setSize(Size size)
{
    setSizeAppearance(sizes[size]);
}

