#include "bbl_printer.h"
#include "model.h"

Model::Model()
{
}

Model::Model(BBLPrinter &printer)
    : printer_(&printer)
{
}

QString Model::url() const
{
    return nullptr;
}

QString Model::title() const
{
    return printer_ ? printer_->gcode_content.c_str() : nullptr;
}

long Model::timeEstimate() const
{
    return 0;
}

QVariantList Model::plates() const
{
    return QVariantList{};
}

QVariantList Model::filaments() const
{
    return QVariantList{};
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
