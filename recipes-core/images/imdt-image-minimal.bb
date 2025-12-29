#
# Copyright (c) 2025 IMD Technologies
#
# IMDT Linux minimal image.
# The purpose of this image is to boot to a console
# and provide ADB / Qualcomm Diag.

inherit qimage populate_sdk_qti

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

# OTA Recovery image is not created to speed up the build, when ENABLE_RECOVERY is not 1 
do_recovery_ext4[noexec] = "${@'1' if d.getVar('ENABLE_RECOVERY') != '1' else ''}"
do_gen_ota_full_zip_ext4[noexec] = "${@'1' if d.getVar('ENABLE_RECOVERY') != '1' else ''}"
