#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-agm-plugin-test
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Change-MI2S-LPAIF-RX-PRIMARY-device-to-2-channels-1.patch"
