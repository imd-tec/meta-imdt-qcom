#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-audio-devicetree
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-SBC8550-DTSI-with-primary-MI2S-device-enabled-wi.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0002-Enable-DMIC4-on-GPIO-177-178-7.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0003-Add-support-for-IMDT-SBC8550-rev5-board-id.patch"
