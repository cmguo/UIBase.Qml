#include "widgets/zbuttonappearance.h"

void ZButtonAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZButtonAppearance(
                           "static_bluegrey_900_disabled", "brand_500_pressed_disabled"));
    types.insert(Secondary, new ZButtonAppearance(
                           "blue_600_disabled", "blue_100_pressed_disabled"));
    types.insert(Tertiary, new ZButtonAppearance(
                           "bluegrey_800_disabled", "bluegrey_100_pressed_disabled"));
    types.insert(Danger, new ZButtonAppearance(
                           "red_600_disabled", "red_100_pressed_disabled"));
    types.insert(TextLink, new ZButtonAppearance(
                           "blue_600_disabled", "transparent_pressed_disabled"));

    sizes.insert(Large, new ZButtonAppearance(
                           44, 24, 0, 32, 0, 18, 20, 5));
    sizes.insert(Middle, new ZButtonAppearance(
                           36, 18, 0, 24, 0, 16, 18, 4));
    sizes.insert(Small, new ZButtonAppearance(
                           24, 12, 0, 12, 0, 14, 16, 3));
    sizes.insert(Thin, new ZButtonAppearance(
                           20, 10, 0, 12, 0, 14, 16, 2));
}
