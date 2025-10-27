#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-audio-kernel
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-TLV320AIC3X-audio-codec-with-externa.patch"
