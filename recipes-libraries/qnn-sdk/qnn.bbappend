#
# Copyright (c) 2024 IMD Technologies
#
PV = "2.30.0.250109"

GOOGLE_DRIVE_URL   = "https://drive.usercontent.google.com/u/0/uc?id=1715KOIwRLg6MncfsxtggJ8CvtO45t2Kg&export=download"
SRC_URI            = "${GOOGLE_DRIVE_URL};downloadfilename=${BPN}-${PV}.tar.xz"
SRC_URI[sha256sum] = "ed9aa149662241684e2d23b5c28d306d38e7e62cd4408182b22871458606c3ef"

S = "${WORKDIR}/${PV}"

PLATFORM_DIR = "aarch64-oe-linux-gcc11.2"

do_install() {
    install -d ${D}/${bindir}
    install -d ${D}/${libdir}/rfsa/adsp
    install -d ${D}/${includedir}

    install -m 0755 ${S}/bin/${PLATFORM_DIR}/* ${D}/${bindir}
    install -m 0755 ${S}/lib/${PLATFORM_DIR}/* ${D}/${libdir}
    install -m 0755 ${S}/lib/${HEXAGON_DIR}/unsigned/* ${D}/${libdir}/rfsa/adsp

    cp -r ${S}/include/QNN/* ${D}/${includedir}
    chmod -R 0755 ${D}/${includedir}
}

INSANE_SKIP:${PN} += "already-stripped"
