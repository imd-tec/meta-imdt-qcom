#
# Copyright (c) 2024 IMD Technologies
#

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

SRC_URI = "git://github.com/xtensor-stack/xsimd.git;protocol=https;branch=master"
SRCREV = "030507c1e5918728b4a4870342b16fab55803cdf"
PV = "11.0.0"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE = ""

DEPENDS = "xtl"
RDEPENDS:${PN} += "xtl"

ALLOW_EMPTY:${PN} = "1"
