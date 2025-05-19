#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-camera-devicetree 
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Added-support-for-all-8-cameras-in-device-tree-18.patch"
