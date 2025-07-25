#
# Copyright (c) 2024 IMD Technologies
#
include ../qcom-ml.inc

PV = "${QNPSDK_SRC_VER}"

SRC_URI = "https://softwarecenter.qualcomm.com/api/download/software/qualcomm_neural_processing_sdk/v${QNPSDK_SRC_VER}.zip"
SRC_URI[sha256sum] = "${QNPSDK_SRC_SHID}"

QNN_DIR = "${WORKDIR}/qairt/${QNPSDK_SRC_VER}"
S = "${QNN_DIR}"

# Fetches the platform directory based on the version of GCC. Defined in qcom-ml.inc
PLATFORM_DIR = "${@platform_dir(d, "QNN_DIR")}"

do_compile[noexec] = "1"
do_package_qa[noexec] = "1"

do_install() {
    install -d ${D}/${bindir}
    install -d ${D}/${libdir}/rfsa/adsp
    install -d ${D}/${includedir}

    install -m 0755 ${QNN_DIR}/lib/${PLATFORM_DIR}/*Qnn* ${D}/${libdir}
    install -m 0755 ${QNN_DIR}/lib/${PLATFORM_DIR}/libPlatformValidatorShared.so ${D}/${libdir}
    install -m 0755 ${QNN_DIR}/lib/${PLATFORM_DIR}/libcalculator.so ${D}/${libdir}
    install -m 0755 ${QNN_DIR}/bin/${PLATFORM_DIR}/qnn* ${D}/${bindir}
    install -m 0755 ${QNN_DIR}/bin/${PLATFORM_DIR}/qtld-net-run ${D}/${bindir}
    install -m 0755 ${QNN_DIR}/lib/${HEXAGON_DIR}/unsigned/libQnn* ${D}/${libdir}/rfsa/adsp
    install -m 0755 ${QNN_DIR}/lib/${HEXAGON_DIR}/unsigned/libCalculator_skel.so ${D}/${libdir}/rfsa/adsp

    cp -r ${QNN_DIR}/include/QNN/* ${D}/${includedir}
    chmod -R 0755 ${D}/${includedir}
}

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

INSANE_SKIP:${PN} += "arch"
INSANE_SKIP:${PN} += "already-stripped"

SOLIBS = ".so"
FILES_SOLIBSDEV = ""

FILES:${PN} += "${libdir}/*"
FILES:${PN} += "${bindir}/*"
FILES:${PN}-dev += "${includedir}/*"
