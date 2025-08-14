#
# Copyright (c) 2025 IMD Technologies
#
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

inherit systemd

SRC_URI = " \
    file://adsp-boot.service \
    file://boot_adsp.sh \
    file://99-remoteproc-adsp.rules \
"

S = "${WORKDIR}"

do_install:append() {
    install -d ${D}${bindir}
    install -d ${D}${base_libdir}/udev/rules.d/
    install -d ${D}${systemd_unitdir}/system/

    install -m 0755 ${S}/boot_adsp.sh ${D}${bindir}
    install -m 0644 ${S}/adsp-boot.service -D ${D}${systemd_unitdir}/system/adsp-boot.service

    install -m 0644 ${S}/99-remoteproc-adsp.rules -D ${D}${base_libdir}/udev/rules.d/99-remoteproc-adsp.rules
}

SYSTEMD_SERVICE:${PN} = "adsp-boot.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

FILES:${PN}:append = " ${bindir}"
FILES:${PN}:append = " ${systemd_unitdir}/system/"
FILES:${PN}:append = " ${base_libdir}/udev/rules.d/"
