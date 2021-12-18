#include "widgets/zswitchbuttonappearance.h"

void ZSwitchButtonAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZSwitchButtonAppearance(
                           "font2", "font1_checked", "icon_pressed_checked"));

    sizes.insert(Large, new ZSwitchButtonAppearance(
                           2, 30, 28, 20));
}
