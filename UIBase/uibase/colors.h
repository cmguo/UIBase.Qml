#ifndef COLORS_H
#define COLORS_H

#include <QObject>
#include <QColor>
#include <QVector>

class Colors : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool dayNightMode READ dayNightMode WRITE setDayNightMode)

    // color properties
    Q_PROPERTY(QColor white_card READ white_card NOTIFY changed)  // #FFFFFF | #212630
    Q_PROPERTY(QColor bluegrey_00 READ bluegrey_00 NOTIFY changed)  // #FFFFFF | #191E26 white_bg
    Q_PROPERTY(QColor bluegrey_05 READ bluegrey_05 NOTIFY changed)  // #F7F8F9 | #262C36
    Q_PROPERTY(QColor bluegrey_50 READ bluegrey_50 NOTIFY changed)  // #F7F8F9 | #0B1117 bluegrey_bg
    Q_PROPERTY(QColor bluegrey_100 READ bluegrey_100 NOTIFY changed)  // #F2F3F4 | #262D38
    Q_PROPERTY(QColor bluegrey_200 READ bluegrey_200 CONSTANT)  // #EBECED
    Q_PROPERTY(QColor bluegrey_300 READ bluegrey_300 NOTIFY changed)  // #E4E6E8 | #2D3440
    Q_PROPERTY(QColor bluegrey_400 READ bluegrey_400 CONSTANT)  // #D5D7DB
    Q_PROPERTY(QColor bluegrey_500 READ bluegrey_500 NOTIFY changed)  // #B7BBBF | #4D5666
    Q_PROPERTY(QColor bluegrey_600 READ bluegrey_600 CONSTANT)  // #9CA0A6
    Q_PROPERTY(QColor bluegrey_700 READ bluegrey_700 NOTIFY changed)  // #81858C | #707C8C
    Q_PROPERTY(QColor bluegrey_800 READ bluegrey_800 NOTIFY changed)  // #4E5359 | #A3AFBF
    Q_PROPERTY(QColor bluegrey_900 READ bluegrey_900 NOTIFY changed)  // #1D2126 | #E2ECFA
    Q_PROPERTY(QColor brand_100 READ brand_100 NOTIFY changed)  // #FFFCD4 | #524C23
    Q_PROPERTY(QColor brand_500 READ brand_500 CONSTANT)  // #FFD630
    Q_PROPERTY(QColor brand_600 READ brand_600 NOTIFY changed)  // #F2C121 | #D9B629
    Q_PROPERTY(QColor red_100 READ red_100 NOTIFY changed)  // #FFEDED | #3D2929
    Q_PROPERTY(QColor red_200 READ red_200 NOTIFY changed)  // #FFD9D9 | #633333
    Q_PROPERTY(QColor red_500 READ red_500 NOTIFY changed)  // #FF6666 | #DA7171
    Q_PROPERTY(QColor red_600 READ red_600 NOTIFY changed)  // #EB3B3B | #E48484
    Q_PROPERTY(QColor redorange_100 READ redorange_100 NOTIFY changed)  // #FFEDE5 | #3E322E
    Q_PROPERTY(QColor redorange_500 READ redorange_500 NOTIFY changed)  // #FF6D2E | #DA825E
    Q_PROPERTY(QColor redorange_600 READ redorange_600 NOTIFY changed)  // #FF4D00 | #E69472
    Q_PROPERTY(QColor orange_100 READ orange_100 NOTIFY changed)  // #FFF0DB | #3C3325
    Q_PROPERTY(QColor orange_500 READ orange_500 NOTIFY changed)  // #FFA319 | #E6A15C
    Q_PROPERTY(QColor orange_600 READ orange_600 NOTIFY changed)  // #FF8C00 | #F2AF6C
    Q_PROPERTY(QColor green_100 READ green_100 NOTIFY changed)  // #E8F7F0 | #203A32
    Q_PROPERTY(QColor green_500 READ green_500 NOTIFY changed)  // #00CC66 | #61BA8D
    Q_PROPERTY(QColor green_600 READ green_600 NOTIFY changed)  // #00B058 | #71C99D
    Q_PROPERTY(QColor cyan_100 READ cyan_100 NOTIFY changed)  // #E1F9FA | #233738
    Q_PROPERTY(QColor cyan_500 READ cyan_500 NOTIFY changed)  // #00D1D9 | #5DC3C6
    Q_PROPERTY(QColor cyan_600 READ cyan_600 NOTIFY changed)  // #00B9BF | #6DD1D4
    Q_PROPERTY(QColor blue_100 READ blue_100 NOTIFY changed)  // #EDF4FF | #213452
    Q_PROPERTY(QColor blue_200 READ blue_200 NOTIFY changed)  // #CCE0FF | #324563
    Q_PROPERTY(QColor blue_500 READ blue_500 NOTIFY changed)  // #4F94FF | #6B99DE
    Q_PROPERTY(QColor blue_600 READ blue_600 NOTIFY changed)  // #1970F2 | #7FA6E2
    Q_PROPERTY(QColor purple_100 READ purple_100 NOTIFY changed)  // #F2F0FD | #343146
    Q_PROPERTY(QColor purple_500 READ purple_500 CONSTANT)  // #8C79F2
    Q_PROPERTY(QColor purple_600 READ purple_600 NOTIFY changed)  // #6A54E0 | #988BDC
    Q_PROPERTY(QColor static_bluegrey_05 READ static_bluegrey_05 CONSTANT)  // #F7F8F9
    Q_PROPERTY(QColor static_bluegrey_50 READ static_bluegrey_50 CONSTANT)  // #F7F8F9
    Q_PROPERTY(QColor static_bluegrey_100 READ static_bluegrey_100 CONSTANT)  // #F2F3F4
    Q_PROPERTY(QColor static_bluegrey_200 READ static_bluegrey_200 CONSTANT)  // #EBECED
    Q_PROPERTY(QColor static_bluegrey_300 READ static_bluegrey_300 CONSTANT)  // #E4E6E8
    Q_PROPERTY(QColor static_bluegrey_400 READ static_bluegrey_400 CONSTANT)  // #D5D7DB
    Q_PROPERTY(QColor static_bluegrey_500 READ static_bluegrey_500 CONSTANT)  // #B7BBBF
    Q_PROPERTY(QColor static_bluegrey_600 READ static_bluegrey_600 CONSTANT)  // #9CA0A6
    Q_PROPERTY(QColor static_bluegrey_700 READ static_bluegrey_700 CONSTANT)  // #81858C
    Q_PROPERTY(QColor static_bluegrey_800 READ static_bluegrey_800 CONSTANT)  // #4E5359
    Q_PROPERTY(QColor static_bluegrey_900 READ static_bluegrey_900 CONSTANT)  // #1D2126
    Q_PROPERTY(QColor static_white_100 READ static_white_100 CONSTANT)  // #FFFFFF
    Q_PROPERTY(QColor static_white_90 READ static_white_90 CONSTANT)  // #FFFFFF 90%
    Q_PROPERTY(QColor static_white_80 READ static_white_80 CONSTANT)  // #FFFFFF 80%
    Q_PROPERTY(QColor static_white_70 READ static_white_70 CONSTANT)  // #FFFFFF 70%
    Q_PROPERTY(QColor static_white_60 READ static_white_60 CONSTANT)  // #FFFFFF 60%
    Q_PROPERTY(QColor static_white_50 READ static_white_50 CONSTANT)  // #FFFFFF 50%
    Q_PROPERTY(QColor static_white_40 READ static_white_40 CONSTANT)  // #FFFFFF 40%
    Q_PROPERTY(QColor static_white_30 READ static_white_30 CONSTANT)  // #FFFFFF 30%
    Q_PROPERTY(QColor static_white_20 READ static_white_20 CONSTANT)  // #FFFFFF 20%
    Q_PROPERTY(QColor static_white_10 READ static_white_10 CONSTANT)  // #FFFFFF 10%
    Q_PROPERTY(QColor static_white_05 READ static_white_05 CONSTANT)  // #FFFFFF 5%
    Q_PROPERTY(QColor static_black_100 READ static_black_100 CONSTANT)  // #000000
    Q_PROPERTY(QColor static_black_90 READ static_black_90 CONSTANT)  // #000000 90%
    Q_PROPERTY(QColor static_black_80 READ static_black_80 CONSTANT)  // #000000 80%
    Q_PROPERTY(QColor static_black_70 READ static_black_70 CONSTANT)  // #000000 70%
    Q_PROPERTY(QColor static_black_60 READ static_black_60 CONSTANT)  // #000000 60%
    Q_PROPERTY(QColor static_black_50 READ static_black_50 CONSTANT)  // #000000 50%
    Q_PROPERTY(QColor static_black_40 READ static_black_40 CONSTANT)  // #000000 40%
    Q_PROPERTY(QColor static_black_30 READ static_black_30 CONSTANT)  // #000000 30%
    Q_PROPERTY(QColor static_black_20 READ static_black_20 CONSTANT)  // #000000 20%
    Q_PROPERTY(QColor static_black_10 READ static_black_10 CONSTANT)  // #000000 10%
    Q_PROPERTY(QColor static_black_05 READ static_black_05 CONSTANT)  // #000000 5%

public:
    static Colors & inst();

private:
    Colors();

signals:
    void changed();

public:
    bool dayNightMode() const;

    void setDayNightMode(bool night);

public:
    // getters
    QColor white_card() const { return colors[0]; }
    QColor bluegrey_00() const { return colors[1]; }
    QColor bluegrey_05() const { return colors[2]; }
    QColor bluegrey_50() const { return colors[3]; }
    QColor bluegrey_100() const { return colors[4]; }
    QColor bluegrey_200() const { return colors[5]; }
    QColor bluegrey_300() const { return colors[6]; }
    QColor bluegrey_400() const { return colors[7]; }
    QColor bluegrey_500() const { return colors[8]; }
    QColor bluegrey_600() const { return colors[9]; }
    QColor bluegrey_700() const { return colors[10]; }
    QColor bluegrey_800() const { return colors[11]; }
    QColor bluegrey_900() const { return colors[12]; }
    QColor brand_100() const { return colors[13]; }
    QColor brand_500() const { return colors[14]; }
    QColor brand_600() const { return colors[15]; }
    QColor red_100() const { return colors[16]; }
    QColor red_200() const { return colors[17]; }
    QColor red_500() const { return colors[18]; }
    QColor red_600() const { return colors[19]; }
    QColor redorange_100() const { return colors[20]; }
    QColor redorange_500() const { return colors[21]; }
    QColor redorange_600() const { return colors[22]; }
    QColor orange_100() const { return colors[23]; }
    QColor orange_500() const { return colors[24]; }
    QColor orange_600() const { return colors[25]; }
    QColor green_100() const { return colors[26]; }
    QColor green_500() const { return colors[27]; }
    QColor green_600() const { return colors[28]; }
    QColor cyan_100() const { return colors[29]; }
    QColor cyan_500() const { return colors[30]; }
    QColor cyan_600() const { return colors[31]; }
    QColor blue_100() const { return colors[32]; }
    QColor blue_200() const { return colors[33]; }
    QColor blue_500() const { return colors[34]; }
    QColor blue_600() const { return colors[35]; }
    QColor purple_100() const { return colors[36]; }
    QColor purple_500() const { return colors[37]; }
    QColor purple_600() const { return colors[38]; }
    QColor static_bluegrey_05() const { return colors[39]; }
    QColor static_bluegrey_50() const { return colors[40]; }
    QColor static_bluegrey_100() const { return colors[41]; }
    QColor static_bluegrey_200() const { return colors[42]; }
    QColor static_bluegrey_300() const { return colors[43]; }
    QColor static_bluegrey_400() const { return colors[44]; }
    QColor static_bluegrey_500() const { return colors[45]; }
    QColor static_bluegrey_600() const { return colors[46]; }
    QColor static_bluegrey_700() const { return colors[47]; }
    QColor static_bluegrey_800() const { return colors[48]; }
    QColor static_bluegrey_900() const { return colors[49]; }
    QColor static_white_100() const { return colors[50]; }
    QColor static_white_90() const { return colors[51]; }
    QColor static_white_80() const { return colors[52]; }
    QColor static_white_70() const { return colors[53]; }
    QColor static_white_60() const { return colors[54]; }
    QColor static_white_50() const { return colors[55]; }
    QColor static_white_40() const { return colors[56]; }
    QColor static_white_30() const { return colors[57]; }
    QColor static_white_20() const { return colors[58]; }
    QColor static_white_10() const { return colors[59]; }
    QColor static_white_05() const { return colors[60]; }
    QColor static_black_100() const { return colors[61]; }
    QColor static_black_90() const { return colors[62]; }
    QColor static_black_80() const { return colors[63]; }
    QColor static_black_70() const { return colors[64]; }
    QColor static_black_60() const { return colors[65]; }
    QColor static_black_50() const { return colors[66]; }
    QColor static_black_40() const { return colors[67]; }
    QColor static_black_30() const { return colors[68]; }
    QColor static_black_20() const { return colors[69]; }
    QColor static_black_10() const { return colors[70]; }
    QColor static_black_05() const { return colors[71]; }

private:
    QVector<QColor> colors;
    QVector<QColor> allColors[2] = {{
        0xFFFFFFFF,0xFFFFFFFF,0xFFF7F8F9,0xFFF7F8F9,0xFFF2F3F4,0xFFEBECED,0xFFE4E6E8,0xFFD5D7DB,0xFFB7BBBF,0xFF9CA0A6,0xFF81858C,0xFF4E5359,0xFF1D2126,0xFFFFFCD4,0xFFFFD630,0xFFF2C121,0xFFFFEDED,0xFFFFD9D9,0xFFFF6666,0xFFEB3B3B,0xFFFFEDE5,0xFFFF6D2E,0xFFFF4D00,0xFFFFF0DB,0xFFFFA319,0xFFFF8C00,0xFFE8F7F0,0xFF00CC66,0xFF00B058,0xFFE1F9FA,0xFF00D1D9,0xFF00B9BF,0xFFEDF4FF,0xFFCCE0FF,0xFF4F94FF,0xFF1970F2,0xFFF2F0FD,0xFF8C79F2,0xFF6A54E0,0xFFF7F8F9,0xFFF7F8F9,0xFFF2F3F4,0xFFEBECED,0xFFE4E6E8,0xFFD5D7DB,0xFFB7BBBF,0xFF9CA0A6,0xFF81858C,0xFF4E5359,0xFF1D2126,0xFFFFFFFF,0xE5FFFFFF,0xCCFFFFFF,0xB2FFFFFF,0x99FFFFFF,0x7FFFFFFF,0x66FFFFFF,0x4CFFFFFF,0x33FFFFFF,0x19FFFFFF,0x0CFFFFFF,0xFF000000,0xE5000000,0xCC000000,0xB2000000,0x99000000,0x7F000000,0x66000000,0x4C000000,0x33000000,0x19000000,0x0C000000,
    }, {
        0xFF212630,0xFF191E26,0xFF262C36,0xFF0B1117,0xFF262D38,0xFFEBECED,0xFF2D3440,0xFFD5D7DB,0xFF4D5666,0xFF9CA0A6,0xFF707C8C,0xFFA3AFBF,0xFFE2ECFA,0xFF524C23,0xFFFFD630,0xFFD9B629,0xFF3D2929,0xFF633333,0xFFDA7171,0xFFE48484,0xFF3E322E,0xFFDA825E,0xFFE69472,0xFF3C3325,0xFFE6A15C,0xFFF2AF6C,0xFF203A32,0xFF61BA8D,0xFF71C99D,0xFF233738,0xFF5DC3C6,0xFF6DD1D4,0xFF213452,0xFF324563,0xFF6B99DE,0xFF7FA6E2,0xFF343146,0xFF8C79F2,0xFF988BDC,0xFFF7F8F9,0xFFF7F8F9,0xFFF2F3F4,0xFFEBECED,0xFFE4E6E8,0xFFD5D7DB,0xFFB7BBBF,0xFF9CA0A6,0xFF81858C,0xFF4E5359,0xFF1D2126,0xFFFFFFFF,0xE5FFFFFF,0xCCFFFFFF,0xB2FFFFFF,0x99FFFFFF,0x7FFFFFFF,0x66FFFFFF,0x4CFFFFFF,0x33FFFFFF,0x19FFFFFF,0x0CFFFFFF,0xFF000000,0xE5000000,0xCC000000,0xB2000000,0x99000000,0x7F000000,0x66000000,0x4C000000,0x33000000,0x19000000,0x0C000000,
    }};
};

#endif
