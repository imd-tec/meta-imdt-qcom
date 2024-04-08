#
# Copyright (c) 2024 IMD Technologies
#

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

SRC_URI = "git://github.com/xtensor-stack/xtensor.git;protocol=https;branch=master"
SRCREV = "3634f2ded19e0cf38208c8b86cea9e1d7c8e397d"
PV = "0.25.0"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE = "-DXTENSOR_USE_XSIMD=ON"

DEPENDS = "xtl xsimd"
RDEPENDS:${PN} += "xtl xsimd"

ALLOW_EMPTY:${PN} = "1"
