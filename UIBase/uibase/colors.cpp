#include "colors.h"

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
