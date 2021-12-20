#include "ztextinputappearance.h".h"
#include "uibase/statecolors.h"
#include "bamboo/ztextinputappearance.h"

#include <QMap>

QMap<ZTextInputAppearance::Type, ZTextInputAppearance*> ZTextInputAppearance::types;
QMap<ZTextInputAppearance::Size, ZTextInputAppearance*> ZTextInputAppearance::sizes;

ZTextInputAppearance::ZTextInputAppearance(QObject *parent)
    : Appearance(parent)
{
    if (types.empty()) {
        initEnumAppearance();
    }
}

ZTextInputAppearance::ZTextInputAppearance(const char *textColor, const char *backgroundColor, const char *borderColor,
                                     QMap<QByteArray, qreal> const & sizes)
{
    init(textColor, backgroundColor, borderColor, nullptr, sizes);
}

ZTextInputAppearance::ZTextInputAppearance(qreal minHeight, qreal cornerRadius, qreal borderWidth, qreal paddingX, qreal paddingY, qreal textSize, qreal iconSize, qreal iconPadding)
{
    init(minHeight, cornerRadius, borderWidth, paddingX, paddingY, textSize, iconSize, iconPadding);
}

ZTextInputAppearance::Type ZTextInputAppearance::type() const
{
    if (type_ == nullptr)
        return Primitive;
    return std::find_if(types.begin(), types.end(), [t = type_](auto v) {
        return v == t;
    }).key();
}

void ZTextInputAppearance::setType(Type type)
{
    setTypeAppearance(types[type]);
}

ZTextInputAppearance::Size ZTextInputAppearance::size() const
{
    if (size_ == nullptr)
        return Large;
    return std::find_if(sizes.begin(), sizes.end(), [s = size_](auto v) {
        return v == s;
    }).key();
}

void ZTextInputAppearance::setSize(Size size)
{
    setSizeAppearance(sizes[size]);
}

