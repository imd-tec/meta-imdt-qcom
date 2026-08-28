#
# Copyright (c) 2026 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Add-support-for-IMDT-SBC8550-rev5-board-id.patch"
