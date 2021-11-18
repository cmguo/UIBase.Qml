#include "widgets/zbuttonappearance.h"

void ZButtonAppearance::initEnumAppearance()
{
    buttonTypes.insert(Primitive, new ZButtonAppearance(
                           "font2_checked", "transparent_checked"));
    buttonTypes.insert(Secondary, new ZButtonAppearance(
                           "font2_checked", "transparent_checked", "font2_checked"));
    buttonTypes.insert(Tertiary, new ZButtonAppearance(
                           "bluegrey_800_disabled", "bluegrey_100_pressed_disabled"));
    buttonTypes.insert(Danger, new ZButtonAppearance(
                           "red_600_disabled", "red_100_pressed_disabled"));
    buttonTypes.insert(TextLink, new ZButtonAppearance(
                           "blue_600_disabled", "transparent_pressed_disabled"));

    buttonSizes.insert(Large, new ZButtonAppearance(
                           68, 20, 1, 60, 0, 18, 20, 5));
    buttonSizes.insert(Middle, new ZButtonAppearance(
                           36, 18, 1, 24, 0, 16, 18, 4));
    buttonSizes.insert(Small, new ZButtonAppearance(
                           24, 12, 1, 12, 0, 14, 16, 3));
    buttonSizes.insert(Thin, new ZButtonAppearance(
                           20, 10, 1, 12, 0, 14, 16, 2));
}
