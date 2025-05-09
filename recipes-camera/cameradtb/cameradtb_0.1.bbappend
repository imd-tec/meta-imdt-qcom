#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# camera-devicetree patches
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Added-support-for-all-8-cameras-in-device-tree-18.patch" 

