#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# CHI-CDK Patches
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-AR1335-into-CHI-CDK-for-SBC8550-41.patch;patchdir=${WORKDIR}"

# CamX Patches
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-AR1335-into-CamX-26.patch;patchdir=${WORKDIR}"

do_configure:prepend() {
    # Run the autogen.sh script to generate source files
    . ${COMMONAUTOGEN}
    . ${CHICDKAUTOGEN} ${@get_platform(d)}
    . ${CAMXAUTOGEN}
}

do_unpack[postfuncs] = ""
