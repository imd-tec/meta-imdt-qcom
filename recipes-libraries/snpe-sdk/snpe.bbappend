#
# Copyright (c) 2024 IMD Technologies
#

PV = "2.16.4.231110"
GOOGLE_DRIVE_URL = "https://drive.usercontent.google.com/u/0/uc?id=1_IQUUpGhF3J3a7IjNIXAJGCb5Pqtu7uZ&export=download"

SRC_URI = "${GOOGLE_DRIVE_URL};downloadfilename=${BPN}-${PV}.tar.xz"
SRC_URI[sha256sum] = "9b0080ba26827523ac584296d6cc8a064e644738a50fb2947f368587c20d56ee"

S = "${WORKDIR}/${PV}"

PLATFORM_DIR = "aarch64-oe-linux-gcc11.2"
HEXAGON_VERSION = "hexagon-v73"

do_install() {
    install -d ${D}/${bindir}
    install -d ${D}/${libdir}/rfsa/adsp

    install -m 0755 ${S}/bin/${PLATFORM_DIR}/* ${D}/${bindir}
    install -m 0755 ${S}/lib/${PLATFORM_DIR}/* ${D}/${libdir}
    install -m 0755 ${S}/lib/${HEXAGON_VERSION}/unsigned/* ${D}/${libdir}/rfsa/adsp

    cp -r ${S}/include/* ${D}/${includedir}
    chmod -R 0755 ${D}/${includedir}

    install -d ${D}/${libdir}/pkgconfig 
    install -m 0755 ${S}/${BPN}.pc ${D}/${libdir}/pkgconfig
}

INSANE_SKIP:${PN} += "already-stripped"

FILES:${PN} += "${libdir}/pkgconfig/*"
