#include "bbl_printer.h"

BBLPrinter::BBLPrinter()
{

}

BBLPrinter &BBLPrinter::inst()
{
    static BBLPrinter inst;
    return inst;
}
