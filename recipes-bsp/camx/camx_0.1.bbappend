#
# Copyright (c) 2024 IMD Technologies
#

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# CHI-CDK Patches
SRC_URI += "file://0001-Added-AR0521-Sensor-Driver-for-HDK-1.patch;patchdir=${WORKDIR}" 

# CamX Patches
SRC_URI += "file://0001-Added-AR0521-to-CamX-build-2.patch;patchdir=${WORKDIR}"
