#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend:imdt-qcs8550-sbc := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc = " file://80-enP1p1s0-dhcp-client.network.disabled \
                                    file://80-enP1p1s0-dhcp-server.network.disabled"

do_install:append:imdt-qcs8550-sbc () {
    install -d ${D}${systemd_unitdir}/network

    install -m 0644 ${WORKDIR}/80-enP1p1s0-dhcp-client.network.disabled ${D}${systemd_unitdir}/network
    install -m 0644 ${WORKDIR}/80-enP1p1s0-dhcp-server.network.disabled ${D}${systemd_unitdir}/network

    if [ -f "${D}${systemd_unitdir}/network/80-wired.network" ]; then
        mv ${D}${systemd_unitdir}/network/80-wired.network ${D}${systemd_unitdir}/network/80-wired.network.disabled    
    fi
}
