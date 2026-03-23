#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-camera-kernel
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Adds-support-for-sensors-behind-an-I2C-Switch-3.patch"

PATCHTOOL = "patch"
