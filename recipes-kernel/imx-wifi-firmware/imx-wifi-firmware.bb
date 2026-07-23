SUMMARY = "NXP Wi-Fi firmware for modules 88w8801/8987/8997/9098 (IW416/IW610/IW612)"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRCBRANCH = "lf-6.12.49_2.2.0"
SRCREV = "8c9b278016c97527b285f2fcbe53c2d428eb171d"

IMX_FIRMWARE_SRC ?= "git://github.com/nxp-imx/imx-firmware.git;protocol=https"
SRC_URI = "\
    ${IMX_FIRMWARE_SRC};branch=${SRCBRANCH} \
    file://moal.conf \
    file://wifi_mod_para.conf \
"

S = "${WORKDIR}/git"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/nxp
    install -d ${D}${sysconfdir}/modprobe.d

    # Install IW610 SDIO Firmware
    install -m 0644 ${S}/FwImage_IW610_SD/sd_iw610.bin.se ${D}${nonarch_base_libdir}/firmware/nxp/sd_iw610.bin.se
    install -m 0644 ${S}/FwImage_IW610_SD/sduart_iw610.bin.se ${D}${nonarch_base_libdir}/firmware/nxp/sduart_iw610.bin.se

    # Install IW416 SDIO Firmware:
    install -m 0644 ${S}/FwImage_IW416_SD/sdiw416_wlan.bin ${D}${nonarch_base_libdir}/firmware/nxp/sdiw416_wlan.bin
    install -m 0644 ${S}/FwImage_IW416_SD/sduartiw416_combo.bin ${D}${nonarch_base_libdir}/firmware/nxp/sduartiw416_combo.bin

    # Install kernel module configuration files
    install -m 0644 ${WORKDIR}/wifi_mod_para.conf ${D}${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf
    install -m 0644 ${WORKDIR}/moal.conf ${D}${sysconfdir}/modprobe.d/moal.conf
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/nxp/* \
    ${sysconfdir}/modprobe.d/* \
"
