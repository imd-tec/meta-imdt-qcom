#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# displaydevicetree patches
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Initial-bringup-of-IMDT-Display-3.patch"
