#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc += " file://acdb_cal.acdb"
SRC_URI:append:imdt-qcs8550-sbc += " file://workspaceFileXml.qwsp"

do_install:append:imdt-qcs8550-sbc () {
    mkdir -p -m 0755 ${D}${sysconfdir}/acdbdata/kalama_mtp
    install -m 0644 ${WORKDIR}/acdb_cal.acdb ${D}${sysconfdir}/acdbdata/kalama_mtp/acdb_cal.acdb
    install -m 0644 ${WORKDIR}/workspaceFileXml.qwsp ${D}${sysconfdir}/acdbdata/kalama_mtp/workspaceFileXml.qwsp
}
