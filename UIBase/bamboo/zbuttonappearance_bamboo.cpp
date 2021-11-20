#include "widgets/zbuttonappearance.h"

void ZButtonAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZButtonAppearance(
                           "font2_checked", "transparent_checked"));
    types.insert(Secondary, new ZButtonAppearance(
                           "font2_checked", "transparent_checked", "font2_checked"));
    types.insert(Tertiary, new ZButtonAppearance(
                           "bluegrey_800_disabled", "bluegrey_100_pressed_disabled"));
    types.insert(Danger, new ZButtonAppearance(
                           "red_600_disabled", "red_100_pressed_disabled"));
    types.insert(TextLink, new ZButtonAppearance(
                           "blue_600_disabled", "transparent_pressed_disabled"));

    sizes.insert(Large, new ZButtonAppearance(
                           68, 20, 1, 60, 0, 18, 20, 5));
    sizes.insert(Middle, new ZButtonAppearance(
                           36, 18, 1, 24, 0, 16, 18, 4));
    sizes.insert(Small, new ZButtonAppearance(
                           24, 12, 1, 12, 0, 14, 16, 3));
    sizes.insert(Thin, new ZButtonAppearance(
                           20, 10, 1, 12, 0, 14, 16, 2));
}
