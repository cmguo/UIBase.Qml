#ifndef BBL_PRINTER_H
#define BBL_PRINTER_H

#include <QObject>

#include <string>

class BBLPrinter : public QObject
{
    Q_OBJECT
public:
    BBLPrinter();

    static BBLPrinter& inst();

signals:
    void changed();

public:
    std::string heatbed_cur_temp = "24.9";
    std::string heatbed_tgt_temp = "60";
    std::string hotend_cur_temp = "30.4";
    std::string hotend_tgt_temp = "60";
    std::string chamber_temp = "60";
};

#endif // BBL_PRINTER_H
