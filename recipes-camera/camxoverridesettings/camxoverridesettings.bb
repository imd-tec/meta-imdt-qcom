#
# Copyright (c) 2024 IMD Technologies
#

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI = "file://camxoverridesettings.txt"

do_install() {
    install -d ${D}/vendor/etc/camera
    install -m 0644 ${WORKDIR}/camxoverridesettings.txt ${D}/vendor/etc/camera/
}

FILES:${PN} = "/vendor/etc/camera/*"
