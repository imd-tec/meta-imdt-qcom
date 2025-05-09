#
# Copyright (c) 2025 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://0001-Amend-CMakeLists-to-look-for-tflite-c-api.patch;patchdir=${WORKDIR}"
