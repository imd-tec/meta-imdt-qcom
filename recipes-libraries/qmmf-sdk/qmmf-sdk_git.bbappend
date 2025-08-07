#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# QMMF-SDK Patches
SRC_URI:append = " file://0001-Added-support-for-RAW8-1.patch"
SRC_URI:append = " file://0002-Add-RAW8-to-ImportBuffer-2.patch"
