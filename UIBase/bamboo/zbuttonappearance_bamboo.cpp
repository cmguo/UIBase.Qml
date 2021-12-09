#include "widgets/zbuttonappearance.h"

void ZButtonAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZButtonAppearance(
                           "font2_checked", "transparent_checked_pressed", "border_checked"));
    types.insert(Secondary, new ZButtonAppearance(
                           "gray_checked_pressed", "transparent_checked", nullptr,
                     {{"height", 62}, {"cornerRadius", 10}, {"borderWidth", 0}}));
    types.insert(Tertiary, new ZButtonAppearance(
                           "text", "light_pressed", "border_pressed"));
    types.insert(Floating, new ZButtonAppearance(
                           "text", "transgray_pressed", nullptr,
                     {{"borderWidth", 0}}));
    types.insert(TextLink, new ZButtonAppearance(
                           "blue_600_disabled", "transparent_pressed_disabled", nullptr,
                     {{"borderWidth", 0}}));

    sizes.insert(Large, new ZButtonAppearance(
                           68, 34, 1, 60, 0, 30, 20, 5));
    sizes.insert(Middle, new ZButtonAppearance(
                           36, 18, 1, 24, 0, 16, 18, 4));
    sizes.insert(Small, new ZButtonAppearance(
                           24, 12, 1, 12, 0, 14, 16, 3));
    sizes.insert(Thin, new ZButtonAppearance(
                           20, 10, 1, 12, 0, 14, 16, 2));
}
