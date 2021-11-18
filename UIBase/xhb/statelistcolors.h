#include "uibase/statelistcolors.h"
#include "uibase/statehandler.h"
#include "uibase/statelistcolor.h"

void StateListColors::defineColors()
{
    defineColor("blue_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::blue_200, (int)StateHandler::Pressed),
                qMakePair(&Colors::blue_100, (int)StateHandler::Normal));
    defineColor("blue_600_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::blue_600, (int)StateHandler::Normal));
    defineColor("bluegrey_00_checked_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::brand_500, (int)StateHandler::Checked),
                qMakePair(&Colors::brand_500, (int)StateHandler::HalfChecked),
                qMakePair(&Colors::bluegrey_00, (int)StateHandler::Normal));
    defineColor("bluegrey_00_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateHandler::Normal));
    defineColor("bluegrey_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_300, (int)StateHandler::Pressed),
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Normal));
    defineColor("bluegrey_300_checked",
                qMakePair(&Colors::brand_500, (int)StateHandler::Checked),
                qMakePair(&Colors::bluegrey_300, (int)StateHandler::Normal));
    defineColor("bluegrey_500_checked_disabled",
                qMakePair(&Colors::bluegrey_300, (int)StateHandler::Disabled),
                qMakePair(&Colors::brand_500, (int)StateHandler::Checked),
                qMakePair(&Colors::brand_500, (int)StateHandler::HalfChecked),
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Normal));
    defineColor("bluegrey_700_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_700, (int)StateHandler::Normal));
    defineColor("bluegrey_800_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_800, (int)StateHandler::Normal));
    defineColor("bluegrey_900_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_900, (int)StateHandler::Normal));
    defineColor("bluegrey_900_disabled2",
                qMakePair(&Colors::bluegrey_300, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_900, (int)StateHandler::Normal));
    defineColor("bluegrey_900_selected_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::red_600, (int)StateHandler::Selected),
                qMakePair(&Colors::bluegrey_900, (int)StateHandler::Normal));
    defineColor("brand_500_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::brand_600, (int)StateHandler::Pressed),
                qMakePair(&Colors::brand_500, (int)StateHandler::Normal));
    defineColor("red_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::red_200, (int)StateHandler::Pressed),
                qMakePair(&Colors::red_100, (int)StateHandler::Normal));
    defineColor("red_600_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::red_600, (int)StateHandler::Normal));
    defineColor("static_bluegrey_900_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::static_bluegrey_900, (int)StateHandler::Normal));
    defineColor("transparent_checked_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateHandler::Checked),
                qMakePair(Colors::transparent, (int)StateHandler::Normal));
    defineColor("transparent_checked_disabled2",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::brand_500, (int)StateHandler::Checked),
                qMakePair(Colors::transparent, (int)StateHandler::Normal));
    defineColor("transparent_halfchecked_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateHandler::HalfChecked),
                qMakePair(Colors::transparent, (int)StateHandler::Normal));
    defineColor("transparent_pressed_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateHandler::Disabled),
                qMakePair(&Colors::bluegrey_200, (int)StateHandler::Pressed),
                qMakePair(Colors::transparent, (int)StateHandler::Normal));
}
