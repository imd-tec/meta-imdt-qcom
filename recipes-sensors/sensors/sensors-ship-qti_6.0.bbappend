#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-sensors-ship
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Configure-SHT4x-temperature-sensor-to-use-QUPv3-SSC-.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0002-Update-Slave-Address-of-AK991X-to-0xC.patch"
