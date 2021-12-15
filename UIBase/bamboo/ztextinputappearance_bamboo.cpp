#include "widgets/ztextinputappearanceh"

void ZTextInputAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZTextInputAppearance(
                           "text", "lightbg2", "border_focused"));

    sizes.insert(Large, new ZTextInputAppearance(
                           68, 34, 1, 60, 0, 30, 20, 5));
}
