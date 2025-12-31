#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " file://sdiouartiw416_combo_v0.bin.lf-6.1.22_2.0.0"

do_install:append() {
    # Install NXP Connectivity IW416 firmware
    install -d ${D}${nonarch_base_libdir}/firmware/mrvl
    install -m 0644 ${WORKDIR}/sdiouartiw416_combo_v0.bin.lf-6.1.22_2.0.0 ${D}${nonarch_base_libdir}/firmware/mrvl/sdiouartiw416_combo_v0.bin
}

PACKAGES =+ "${PN}-iw416-sdio"
FILES:${PN}-iw416-sdio = "${nonarch_base_libdir}/firmware/mrvl/sdiouartiw416_combo_v0.bin"
