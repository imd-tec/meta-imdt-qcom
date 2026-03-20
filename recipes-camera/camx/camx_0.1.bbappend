#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-prop-chi-cdk
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-AR1335-into-CHI-CDK-for-SBC8550-41.patch;patchdir=${WORKDIR}"
SRC_URI:append:imdt-qcs8550-sbc = " file://0002-Added-support-for-AR1335-on-CSI4-and-CSI6-51.patch;patchdir=${WORKDIR}"
SRC_URI:append:imdt-qcs8550-sbc = " file://0003-Add-support-for-AR1335-on-slot-5-and-slot-7-94.patch;patchdir=${WORKDIR}"

# Patches for qcom-prop-camx
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-AR1335-into-CamX-26.patch;patchdir=${WORKDIR}"

do_configure:prepend() { 
    # Run the autogen.sh script to generate source files
    . ${COMMONAUTOGEN}
    . ${CHICDKAUTOGEN} ${@get_platform(d)}
    . ${CAMXAUTOGEN}
}

do_unpack[postfuncs] = ""
