#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-display-devicetree
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Initial-bringup-of-IMDT-Display-3.patch"
