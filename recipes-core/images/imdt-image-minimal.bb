#
# Copyright (c) 2025 IMD Technologies
#
# IMDT Linux minimal image.
# The purpose of this image is to boot to a console
# and provide ADB / Qualcomm Diag.

inherit qimage-extended populate_sdk_qti

CORE_IMAGE_EXTRA_INSTALL += "\
    glib-2.0 \
    kernel-modules \
    gki-kernel-modules-second-stage \
    systemd-machine-units \
    packagegroup-android-utils \
    packagegroup-startup-scripts \
    packagegroup-support-utils \
    packagegroup-filesystem-utils \
    packagegroup-qti-core \
    packagegroup-qti-core-prop \
"
