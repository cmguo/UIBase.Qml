#ifndef BBL_PRINTER_H
#define BBL_PRINTER_H

#include "axiscontroller.h"

#include <QObject>

#include <string>

class BBLPrinter : public QObject
{
    Q_OBJECT
public:
    BBLPrinter();

    static BBLPrinter& inst();

    enum MODULE {
        MODULE_PRINT_FAN,
        MODULE_CHAMBER_FAN,
        MODULE_CHAMBER_LED,
    };

    Q_ENUM(MODULE)

public:
    void moveAxis(AxisController::Axis axis, AxisController::Direction dir, AxisController::Unit unit);

    void moduleControl(bool * state, bool on);

signals:
    void changed();

public:
    std::string heatbed_cur_temp = "24.9";
    std::string heatbed_tgt_temp = "60";
    std::string hotend_cur_temp = "30.4";
    std::string hotend_tgt_temp = "60";
    std::string chamber_temp = "60";

    std::string gcode_state = "1";
    std::string gcode_content = "Test Model";
    std::string gcode_duration = "20000";
    std::string gcode_progress = "30";

    bool print_fan_on = false;
    bool chamber_fan_on = false;
    bool chamber_led_on = false;
    bool print_fan2_on = false;
    bool end_fan_on = false;

    std::string netip = "192.168.1.233";
    std::string netmask = "255.255.0.0";

    std::string product = "BBL-004";
    std::string seriaNo = "abcdef12345678";
    std::string version = "0.0.1";
};

#endif // BBL_PRINTER_H
