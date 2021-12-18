#include "widgets/zprogressbarappearance.h"

void ZProgressBarAppearance::initEnumAppearance()
{
    types.insert(Primitive, new ZProgressBarAppearance(
                           "lightbg1", "tips", "text"));
    types.insert(Secondary, new ZProgressBarAppearance(
                           "lightbg1", "tips", "#838383"));

    sizes.insert(Large, new ZProgressBarAppearance(
                           0, 12, 20, 24));
    sizes.insert(Middle, new ZProgressBarAppearance(
                           0, 5, 8, 10));
    sizes.insert(Small, new ZProgressBarAppearance(
                           0, 0, 0, 2));
}
