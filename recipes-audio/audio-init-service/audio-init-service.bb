#
# Copyright (c) 2025 IMD Technologies
#
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

inherit systemd

SRC_URI = " \
    file://audio-init.service \
    file://setup-audio.sh \
"

S = "${WORKDIR}"

do_install:append() {
    install -d ${D}${bindir}
    install -d ${D}${systemd_unitdir}/system/

    install -m 0755 ${S}/setup-audio.sh ${D}${bindir}
    install -m 0644 ${S}/audio-init.service -D ${D}${systemd_unitdir}/system/audio-init.service
}

SYSTEMD_SERVICE:${PN} = "audio-init.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

FILES:${PN}:append = " ${bindir}"
FILES:${PN}:append = " ${systemd_unitdir}/system/"
