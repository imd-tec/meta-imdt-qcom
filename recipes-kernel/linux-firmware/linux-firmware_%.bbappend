#
# Copyright (c) 2026 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " file://CYPD6125-40LQXI_notebook_1.cyacd \
                   file://CYPD6125-40LQXI_notebook_2.cyacd \
"

do_install:append() {
    # Install CYPD Firmware
    install -m 0644 ${WORKDIR}/CYPD6125-40LQXI_notebook_1.cyacd ${D}${nonarch_base_libdir}/firmware/ccg_secondary.cyacd
    install -m 0644 ${WORKDIR}/CYPD6125-40LQXI_notebook_2.cyacd ${D}${nonarch_base_libdir}/firmware/ccg_primary.cyacd
}

PACKAGES =+ "${PN}-cypd6125"
PROVIDES =+ "${PN}-cypd6125"
FILES:${PN}-cypd6125 = "${nonarch_base_libdir}/firmware/ccg_secondary.cyacd \
                        ${nonarch_base_libdir}/firmware/ccg_primary.cyacd \
"
