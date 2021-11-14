#include "statehandler.h"
#include "statelistcolor.h"
#include "statelistcolors.h"

StateListColors &StateListColors::inst()
{
    static StateListColors c;
    return c;
}


StateListColors::StateListColors(QObject *parent)
    : QObject(parent)
{
    setObjectName("StateListColors");
    defineColor("blue_100_pressed_disabled",
                qMakePair(&Colors::bluegrey_100, (int)StateHandler::Disabled),
                qMakePair(&Colors::blue_200, (int)StateHandler::Pressed),
                qMakePair(&Colors::blue_100, (int)StateHandler::Normal));
}
