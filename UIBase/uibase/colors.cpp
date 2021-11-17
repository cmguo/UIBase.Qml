#include "colors.h"

const QColor Colors::transparent = QRgba64::fromRgba64(0);

Colors::Colors()
{
    colors = allColors[0];
}

Colors &Colors::inst()
{
    static Colors c;
    return c;
}

bool Colors::dayNightMode() const
{
    return colors.data() == allColors[1].data();
}

void Colors::setDayNightMode(bool night)
{
    if (night == dayNightMode())
        return;
    colors = night ? allColors[1] : allColors[0];
    emit changed();
}

Colors::StdColor Colors::stdColor(const char *name) const
{
    return stdColors.value(name);
}
