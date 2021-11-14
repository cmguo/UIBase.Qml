#ifndef DESTINY_H
#define DESTINY_H

#include "UiBase_global.h"

#include <QObject>

class UIBASE_EXPORT Destiny : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int screenWidth READ getScreenWidth CONSTANT)
    Q_PROPERTY(int screenHeight READ getScreenHeight CONSTANT)

public:
    Destiny();

private:
    int getScreenWidth();

    int getScreenHeight();

public slots:
    /**
     * @brief dp This is used for view pixel size.
     * @param dp
     * @return
     */
    qreal dp(qreal dp);

    /**
     * @brief sp This method is used for font size.
     * @param dp
     * @return
     */
    qreal sp(qreal dp);

private:
    int screenHeight;
    int screenWidth;
    float destiny_scale_ = 1.0f;
};

#endif // DESTINY_H
