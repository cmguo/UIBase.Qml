PRODUCT_CONFIG=$$(PRODUCT_CONFIG)
PRODUCT_CONFIG=test
CONFIG += $$PRODUCT_CONFIG

RELATIVE_DIR=../$$RELATIVE_DIR

OUTPUT_DIR=$$(OUTPUT_DIR)
isEmpty(OUTPUT_DIR) {
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD/$${RELATIVE_DIR}release
    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/$${RELATIVE_DIR}debug
} else {
    CONFIG(release, debug|release): DESTDIR = $$OUTPUT_DIR/release
    CONFIG(debug, debug|release): DESTDIR = $$OUTPUT_DIR/debug
}
LIBS += -L$$DESTDIR

plugin: {
    DESTDIR = $$DESTDIR/plugins/components
}

#include($$PWD/platforms/platforms.pri)
include($$PWD/products/products.pri)

message($$DESTDIR)
