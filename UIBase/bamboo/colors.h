#ifndef COLORS_H
#define COLORS_H

#include <QObject>
#include <QColor>
#include <QVector>
#include <QMap>

class Colors : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool dayNightMode READ dayNightMode WRITE setDayNightMode)

    // color properties
    Q_PROPERTY(QColor brand READ brand CONSTANT)  // #00AE42
    Q_PROPERTY(QColor graybg READ graybg CONSTANT)  // #262626
    Q_PROPERTY(QColor lightbg1 READ lightbg1 CONSTANT)  // #F0F0F0
    Q_PROPERTY(QColor lightbg2 READ lightbg2 CONSTANT)  // #F8F8F8
    Q_PROPERTY(QColor font1 READ font1 CONSTANT)  // #C4C4C4
    Q_PROPERTY(QColor font2 READ font2 CONSTANT)  // #808080
    Q_PROPERTY(QColor text READ text CONSTANT)  // #2C2C2E
    Q_PROPERTY(QColor tips READ tips CONSTANT)  // #E2E2E2

public:
    static Colors & inst();

private:
    Colors();

signals:
    void changed();

public:
    bool dayNightMode() const;

    void setDayNightMode(bool night);

    typedef QColor (Colors::* StdColor)(void) const;
    StdColor stdColor(char const * name) const;

    static const QColor transparent;

public:
    // getters
    QColor brand() const { return colors[0]; }
    QColor graybg() const { return colors[1]; }
    QColor lightbg1() const { return colors[2]; }
    QColor lightbg2() const { return colors[3]; }
    QColor font1() const { return colors[4]; }
    QColor font2() const { return colors[5]; }
    QColor text() const { return colors[6]; }
    QColor tips() const { return colors[7]; }

private:
    QVector<QColor> colors;
    QVector<QColor> allColors[2] = {{
        0xFF00AE42,0xFF262626,0xFFF0F0F0,0xFFF8F8F8,0xFFC4C4C4,0xFF808080,0xFF2C2C2E,0xFFE2E2E2,
    }, {
        0xFF00AE42,0xFF262626,0xFFF0F0F0,0xFFF8F8F8,0xFFC4C4C4,0xFF808080,0xFF2C2C2E,0xFFE2E2E2,
    }};
    QMap<QByteArray, StdColor> stdColors = {
        {"brand", &Colors::brand},
        {"graybg", &Colors::graybg},
        {"lightbg1", &Colors::lightbg1},
        {"lightbg2", &Colors::lightbg2},
        {"font1", &Colors::font1},
        {"font2", &Colors::font2},
        {"text", &Colors::text},
        {"tips", &Colors::tips},
    };
};

#endif
