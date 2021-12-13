#ifndef CONVERTER_H
#define CONVERTER_H

#include <QMetaType>
#include <QVariant>
#include <QDebug>

template <template<typename> class TContainer, typename TClass, typename TAppendRet = void>
bool registerListContainerConverters(TAppendRet (TContainer<TClass>::*appendMethod)(const TClass &) = &TContainer<TClass>::append,
                                                void (TContainer<TClass>::*reserveMethod)(int) = &TContainer<TClass>::reserve);

template <template<typename> class TContainer, typename TClass, typename TAppendRet>
inline bool registerListContainerConverters(TAppendRet (TContainer<TClass>::*appendMethod)(const TClass &), void (TContainer<TClass>::*reserveMethod)(int))
{
    return QMetaType::registerConverter<TContainer<TClass>, QVariantList>([](const TContainer<TClass> &list) -> QVariantList {
        QVariantList l;
        l.reserve(list.size());
        for(const auto &v : list)
            l.append(QVariant::fromValue(v));
        return l;
    }) & QMetaType::registerConverter<QVariantList, TContainer<TClass>>([appendMethod, reserveMethod](const QVariantList &list) -> TContainer<TClass> {
        TContainer<TClass> l;
        if(reserveMethod)
            (l.*reserveMethod)(list.size());
        for(auto v : list) { // clazy:exclude=range-loop
            const auto vt = v.type();
            if(v.convert(qMetaTypeId<TClass>()))
                (l.*appendMethod)(v.value<TClass>());
            else {
                qWarning() << "Conversion to"
                           << QMetaType::typeName(qMetaTypeId<TContainer<TClass>>())
                           << "failed, could not convert element of type"
                           << QMetaType::typeName(vt);
                (l.*appendMethod)(TClass());
            }
        }
        return l;
    });
}

#endif // CONVERTER_H
