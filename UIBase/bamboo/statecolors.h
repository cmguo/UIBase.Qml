#include "uibase/statecolors.h"

void StateColors::defineColors()
{
    defineColor("transparent_checked",
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(Colors::transparent, (int)StateColor::Normal));
    defineColor("font2_checked",
                qMakePair(Qt::white, (int)StateColor::Checked),
                qMakePair(&Colors::font2, (int)StateColor::Normal));
}
