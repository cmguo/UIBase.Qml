#include "destiny.h"

#include <QGuiApplication>
#include <QScreen>

Destiny::Destiny()
    : QObject()
{
    int screen_height = QGuiApplication::primaryScreen()->size().height();
    destiny_scale_ = screen_height / 1080.0f;
    screenWidth = QGuiApplication::primaryScreen()->size().width();
    screenHeight = QGuiApplication::primaryScreen()->size().height();
}

int Destiny::getScreenWidth() {
    return screenWidth;
}

int Destiny::getScreenHeight() {
    return screenHeight;
}

qreal Destiny::dp(qreal dp)
{
    return (std::max)(dp * destiny_scale_, 1.0);
}

qreal Destiny::sp(qreal dp)
{
    return (std::max)(dp * destiny_scale_, 10.0);
}
