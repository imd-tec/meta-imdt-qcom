#
# Copyright (c) 2024 IMD Technologies
#
include ../qcom-ml.inc

PV = "${QNPSDK_SRC_VER}"

SRC_URI = "https://softwarecenter.qualcomm.com/api/download/software/qualcomm_neural_processing_sdk/v${QNPSDK_SRC_VER}.zip;name=sdk \
           file://${BPN}.pc;name=conf"
SRC_URI[sdk.sha256sum] = "${QNPSDK_SRC_SHID}"
SRC_URI[conf.sha256sum] = "895c43dbc9210ff1e1fa2c29f238d591bfaf656ac6f2d7cf79982a227fe031d1"

SNPE_DIR = "${WORKDIR}/qairt/${QNPSDK_SRC_VER}"
S = "${SNPE_DIR}"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Fetches the platform directory based on the version of GCC. Defined in qcom-ml.inc
PLATFORM_DIR = "${@platform_dir(d, "SNPE_DIR")}"

do_compile[noexec] = "1"
do_package_qa[noexec] = "1"

do_install() {
    install -d ${D}/${bindir}
    install -d ${D}/${libdir}/rfsa/adsp
    install -d ${D}/${includedir}

    install -m 0755 ${SNPE_DIR}/lib/${PLATFORM_DIR}/*Snpe* ${D}/${libdir}
    install -m 0755 ${SNPE_DIR}/lib/${PLATFORM_DIR}/libSNPE.so ${D}/${libdir}
    install -m 0755 ${SNPE_DIR}/lib/${PLATFORM_DIR}/libhta_hexagon_runtime_snpe.so ${D}/${libdir}
    install -m 0755 ${SNPE_DIR}/bin/${PLATFORM_DIR}/snpe* ${D}/${bindir}
    install -m 0755 ${SNPE_DIR}/lib/${HEXAGON_DIR}/unsigned/libSnpe* ${D}/${libdir}/rfsa/adsp

    cp -r ${SNPE_DIR}/include/SNPE/* ${D}/${includedir}
    chmod -R 0755 ${D}/${includedir}

    install -d ${D}/${libdir}/pkgconfig 
    install -m 0755 ${WORKDIR}/${BPN}.pc ${D}/${libdir}/pkgconfig
}

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

INSANE_SKIP:${PN} += "arch"
INSANE_SKIP:${PN} += "already-stripped"

SOLIBS = ".so"
FILES_SOLIBSDEV = ""

FILES:${PN} += "${libdir}/*"
FILES:${PN} += "${libdir}/rfsa/adsp"
FILES:${PN} += "${bindir}/*"
FILES:${PN}-dev += "${includedir}/*"
