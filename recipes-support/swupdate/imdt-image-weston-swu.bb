#
# Copyright (c) 2026 IMD Technologies
#

DESCRIPTION = "Create a SWUpdate image for OTA updates"

LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Proprietary;md5=0557f9d92cf58f2ccdd50f62f8ac0b28"

inherit swupdate

SRC_URI = " \
    file://sw-description \
    file://update.sh \
"

IMAGE_DEPENDS += "imdt-image-weston"

SWUPDATE_IMAGES = "ota-scripts/update_ext4.zip"

# We need to explicitly build the Android OTA update image as it's not built
# as part of the image build. And we need to build it before we create the
# SWU image as this is what we use to create the SWU image.
do_swuimage[depends] += "imdt-image-weston:do_gen_ota_full_zip_ext4"