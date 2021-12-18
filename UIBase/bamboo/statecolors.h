#include "uibase/statecolors.h"

void StateColors::defineColors()
{
    // primitive button background
    defineColor("transparent_checked_pressed",
                qMakePair(0x157B3C, (int)StateColor::Checked|StateColor::Pressed),
                qMakePair(&Colors::tips, (int)StateColor::Pressed),
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(Qt::transparent, (int)StateColor::Normal));

    // secondary button background
    defineColor("transparent_checked",
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(Qt::transparent, (int)StateColor::Normal));

    // tertiary button background
    defineColor("light_pressed",
                qMakePair(&Colors::tips, (int)StateColor::Pressed),
                qMakePair(&Colors::lightbg2, (int)StateColor::Normal));

    // primitive button border
    defineColor("border_checked",
                qMakePair(Qt::transparent, (int)StateColor::Checked),
                qMakePair(0x39393B, (int)StateColor::Normal));

    // tertiary button border
    defineColor("border_pressed",
                qMakePair(Qt::transparent, (int)StateColor::Pressed),
                qMakePair(0x39393B, (int)StateColor::Normal));

    // floating button background
    defineColor("transgray_pressed",
                qMakePair(QRgba64::fromArgb32(0x33262626), (int)StateColor::Pressed),
                qMakePair(QRgba64::fromArgb32(0x1A262626), (int)StateColor::Normal));

    // button text
    defineColor("font2_checked",
                qMakePair(Qt::white, (int)StateColor::Checked),
                qMakePair(&Colors::font2, (int)StateColor::Normal));

    // secondary button text
    defineColor("gray_checked_pressed",
                qMakePair(Qt::white, (int)StateColor::Checked),
                qMakePair(&Colors::font2, (int)StateColor::Pressed),
                qMakePair(&Colors::graybg, (int)StateColor::Normal));

    // switch background
    defineColor("font1_checked",
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(&Colors::font1, (int)StateColor::Normal));

    // switch icon
    defineColor("icon_pressed_checked",
                qMakePair(0xcccccc, (int)StateColor::Pressed),
                qMakePair(0xf3f3f3, (int)StateColor::Checked),
                qMakePair(0xf3f3f3, (int)StateColor::Normal));

    //
    defineColor("transparent_checked_pressed2",
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(QRgba64::fromArgb32(0x8000AE42), (int)StateColor::Pressed),
                qMakePair(Qt::transparent, (int)StateColor::Normal));

    defineColor("white_checked",
                qMakePair(&Colors::brand, (int)StateColor::Checked),
                qMakePair(Qt::white, (int)StateColor::Normal));


    // textinput border
    defineColor("border_focused",
                qMakePair(&Colors::brand, (int)StateColor::Focused),
                qMakePair(0x39393B, (int)StateColor::Normal));
}
