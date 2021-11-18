#include "uibase/statelistcolors.h"
#include "uibase/statehandler.h"
#include "uibase/statelistcolor.h"

void StateListColors::defineColors()
{
    defineColor("transparent_checked",
                qMakePair(&Colors::brand, (int)StateHandler::Checked),
                qMakePair(Colors::transparent, (int)StateHandler::Normal));
    defineColor("font2_checked",
                qMakePair(Qt::white, (int)StateHandler::Checked),
                qMakePair(&Colors::font2, (int)StateHandler::Normal));
}
