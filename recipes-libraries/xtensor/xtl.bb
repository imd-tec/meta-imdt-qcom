#
# Copyright (c) 2024 IMD Technologies
#

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

SRC_URI = "git://github.com/xtensor-stack/xtl.git;protocol=https;branch=master"
SRCREV = "a7c1c5444dfc57f76620391af4c94785ff82c8d6"
PV = "0.7.7"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE = ""

ALLOW_EMPTY:${PN} = "1"
