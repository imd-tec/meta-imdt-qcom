#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc = " file://mixer_paths_kalama_mtp.xml"
SRC_URI:append:imdt-qcs8550-sbc = " file://resourcemanager_kalama_mtp.xml"

do_install:append:imdt-qcs8550-sbc() {
	install -m 0644 ${WORKDIR}/mixer_paths_kalama_mtp.xml ${D}${sysconfdir}/mixer_paths_kalama_mtp.xml
	install -m 0644 ${WORKDIR}/resourcemanager_kalama_mtp.xml ${D}${sysconfdir}/resourcemanager_kalama_mtp.xml
}
