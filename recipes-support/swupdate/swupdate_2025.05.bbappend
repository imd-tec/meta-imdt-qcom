#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc = " \
    file://0001-Rebrand-the-SWUpdate-UI.patch \
    file://20-swupdate-args \
    file://logo.png \
"

do_install:append:imdt-qcs8550-sbc() {
    install -m 644 ${WORKDIR}/20-swupdate-args ${D}${libdir}/swupdate/conf.d/
    install -m 644 ${WORKDIR}/logo.png ${D}/www/images/
}

