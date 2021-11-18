#include "uibase/statecolors.h"

void StateColors::defineColors()
{
    defineColor("blue_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::blue_200, (int)StateColor::Pressed),
                qMakePair(&Colors::blue_100, (int)StateColor::Normal));
    defineColor("blue_600_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::blue_600, (int)StateColor::Normal));
    defineColor("bluegrey_00_checked_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::brand_500, (int)StateColor::Checked),
                qMakePair(&Colors::brand_500, (int)StateColor::HalfChecked),
                qMakePair(&Colors::bluegrey_00, (int)StateColor::Normal));
    defineColor("bluegrey_00_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateColor::Normal));
    defineColor("bluegrey_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_300, (int)StateColor::Pressed),
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Normal));
    defineColor("bluegrey_300_checked",
                qMakePair(&Colors::brand_500, (int)StateColor::Checked),
                qMakePair(&Colors::bluegrey_300, (int)StateColor::Normal));
    defineColor("bluegrey_500_checked_disabled",
                qMakePair(&Colors::bluegrey_300, (int)StateColor::Disabled),
                qMakePair(&Colors::brand_500, (int)StateColor::Checked),
                qMakePair(&Colors::brand_500, (int)StateColor::HalfChecked),
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Normal));
    defineColor("bluegrey_700_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_700, (int)StateColor::Normal));
    defineColor("bluegrey_800_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_800, (int)StateColor::Normal));
    defineColor("bluegrey_900_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_900, (int)StateColor::Normal));
    defineColor("bluegrey_900_disabled2",
                qMakePair(&Colors::bluegrey_300, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_900, (int)StateColor::Normal));
    defineColor("bluegrey_900_selected_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::red_600, (int)StateColor::Selected),
                qMakePair(&Colors::bluegrey_900, (int)StateColor::Normal));
    defineColor("brand_500_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::brand_600, (int)StateColor::Pressed),
                qMakePair(&Colors::brand_500, (int)StateColor::Normal));
    defineColor("red_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateColor::Disabled),
                qMakePair(&Colors::red_200, (int)StateColor::Pressed),
                qMakePair(&Colors::red_100, (int)StateColor::Normal));
    defineColor("red_600_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::red_600, (int)StateColor::Normal));
    defineColor("static_bluegrey_900_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::static_bluegrey_900, (int)StateColor::Normal));
    defineColor("transparent_checked_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateColor::Checked),
                qMakePair(Colors::transparent, (int)StateColor::Normal));
    defineColor("transparent_checked_disabled2",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::brand_500, (int)StateColor::Checked),
                qMakePair(Colors::transparent, (int)StateColor::Normal));
    defineColor("transparent_halfchecked_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_00, (int)StateColor::HalfChecked),
                qMakePair(Colors::transparent, (int)StateColor::Normal));
    defineColor("transparent_pressed_disabled",
                qMakePair(&Colors::bluegrey_500, (int)StateColor::Disabled),
                qMakePair(&Colors::bluegrey_200, (int)StateColor::Pressed),
                qMakePair(Colors::transparent, (int)StateColor::Normal));
}
