#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-display-kernel
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Disable-regulators-on-error-path-in-dsi_display_init.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0002-Add-Type-C-Mux-as-a-HPD-device-in-the-DP-stack-1.patch"
