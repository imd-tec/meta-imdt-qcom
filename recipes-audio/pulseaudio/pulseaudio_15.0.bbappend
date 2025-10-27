#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend:imdt-qcs8550-sbc := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc += " file://system.pa"
SRC_URI:append:imdt-qcs8550-sbc += " file://kalama-mtp-snd-card.conf"

do_install:append:imdt-qcs8550-sbc () {
	install -d ${D}${datadir}/pulseaudio/qal/configs/
	install -m 0644 ${WORKDIR}/system.pa ${D}${sysconfdir}/pulse/system.pa
	install -m 0644 ${WORKDIR}/kalama-mtp-snd-card.conf ${D}${datadir}/pulseaudio/qal/configs/
}

FILES:${PN}:append:imdt-qcs8550-sbc += "${datadir}/*"
