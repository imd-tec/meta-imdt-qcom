#
# Copyright (c) 2024 IMD Technologies
#

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

PV = "1.0.0"
GOOGLE_DRIVE_URL = "https://drive.usercontent.google.com/download?id=1q0-3oyLRQvCfnI8Er0fV7M3-1w2zXC4A&export=download&authuser=0"
SRC_URI = "${GOOGLE_DRIVE_URL};downloadfilename=gstreamer1.0-esdk_${PV}.tar.gz"
SRC_URI[sha256sum] = "1b9e3c32d064a882ec3a5afc3f7126ddcaa308b20f7deb6b1b228f1fa7e697b9"

S = "${WORKDIR}/gstreamer1.0-esdk"

do_compile[noexec] = "1"
do_package_qa[noexec] = "1"

do_install() {
    install -d ${D}/${bindir}
    install -d ${D}/${includedir}
    install -d ${D}/${libexecdir}
    install -d ${D}/${libdir}

    cp -r ${S}/lib/* ${D}/${libdir}/
    cp -r ${S}/${libdir}/* ${D}/${libdir}/
    chmod -R 0755 ${D}/${libdir}

    cp -r ${S}/${libexecdir}/* ${D}/${libexecdir}/
    chmod -R 0755 ${D}/${libexecdir}

    cp -r ${S}/${bindir}/* ${D}/${bindir}/
    chmod -R 0755 ${D}/${bindir}

    cp -r ${S}/${includedir}/* ${D}/${includedir}/
    chmod -R 0755 ${D}/${includedir}

    #Copy libgstreamer-1.0.so because the link is missing on the installation
    cp ${S}/${libdir}/libgstreamer-1.0.so.0.2006.0 ${D}/${libdir}/libgstreamer-1.0.so.0
}

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

INSANE_SKIP:${PN} += "already-stripped"

FILES:${PN} += "${libdir}/pkgconfig/*"
FILES:${PN} += "${libdir}/gstreamer-1.0/*"
FILES:${PN} += "${bindir}/*"
FILES:${PN} += "${libexecdir}/gstreamer-1.0/*"
FILES:${PN} += "${libdir}/girepository-1.0/*"
