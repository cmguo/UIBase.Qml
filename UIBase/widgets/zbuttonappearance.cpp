#include "zbuttonappearance.h"
#include "uibase/statecolors.h"
#include "bamboo/zbuttonappearance.h"

#include <QMap>

QMap<ZButtonAppearance::Type, ZButtonAppearance*> ZButtonAppearance::types;
QMap<ZButtonAppearance::Size, ZButtonAppearance*> ZButtonAppearance::sizes;

ZButtonAppearance::ZButtonAppearance(QObject *parent)
    : Appearance(parent)
{
    if (types.empty()) {
        initEnumAppearance();
    }
}

ZButtonAppearance::ZButtonAppearance(const char *textColor, const char *backgroundColor, const char *borderColor,
                                     QMap<QByteArray, qreal> const & sizes)
{
    init(textColor, backgroundColor, borderColor, nullptr, sizes);
}

ZButtonAppearance::ZButtonAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth, qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding)
{
    init(minHeight, cornerRadius, borderWidth, paddingX, paddingY, textSize, iconSize, iconPadding);
}

ZButtonAppearance::Type ZButtonAppearance::type() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(types.begin(), types.end(), [t = type_](auto v) {
        return v == t;
    }).key();
}

void ZButtonAppearance::setType(Type type)
{
    setTypeAppearance(types[type]);
}

ZButtonAppearance::Size ZButtonAppearance::size() const
{
    if (size_ == nullptr)
        return Large;
    return std::find_if(sizes.begin(), sizes.end(), [s = size_](auto v) {
        return v == s;
    }).key();
}

void ZButtonAppearance::setSize(Size size)
{
    setSizeAppearance(sizes[size]);
}

