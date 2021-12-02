#include "model.h"

Model::Model()
{

}

QString Model::url() const
{
    return nullptr;
}

QString Model::title() const
{
    return nullptr;
}

long Model::timeEstimate() const
{
    return 0;
}

QList<Plate> Model::plates() const
{
    return {};
}

QList<Filament> Model::filaments() const
{
    return {};
}

QByteArray Plate::thumnail() const
{
    return nullptr;
}

QColor Plate::color() const
{
    return Qt::transparent;
}

bool Plate::finished() const
{
    return false;
}
