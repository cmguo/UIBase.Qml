#include "widgets/zbuttonappearance.h"

void ZButtonAppearance::initEnumAppearance()
{
    buttonTypes.insert(Primitive, new ZButtonAppearance(
                           "static_bluegrey_900_disabled", "brand_500_pressed_disabled"));
    buttonTypes.insert(Secondary, new ZButtonAppearance(
                           "blue_600_disabled", "blue_100_pressed_disabled"));
    buttonTypes.insert(Tertiary, new ZButtonAppearance(
                           "bluegrey_800_disabled", "bluegrey_100_pressed_disabled"));
    buttonTypes.insert(Danger, new ZButtonAppearance(
                           "red_600_disabled", "red_100_pressed_disabled"));
    buttonTypes.insert(TextLink, new ZButtonAppearance(
                           "blue_600_disabled", "transparent_pressed_disabled"));

    buttonSizes.insert(Large, new ZButtonAppearance(
                           44, 24, 0, 32, 0, 18, 20, 5));
    buttonSizes.insert(Middle, new ZButtonAppearance(
                           36, 18, 0, 24, 0, 16, 18, 4));
    buttonSizes.insert(Small, new ZButtonAppearance(
                           24, 12, 0, 12, 0, 14, 16, 3));
    buttonSizes.insert(Thin, new ZButtonAppearance(
                           20, 10, 0, 12, 0, 14, 16, 2));
}
