#
# Copyright (c) 2025 IMD Technologies
#

DESCRIPTION = "Create a SWUpdate image for the Ofil Mirage SBC "

LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Proprietary;md5=0557f9d92cf58f2ccdd50f62f8ac0b28"

inherit swupdate qimage

FILESEXTRAPATHS:prepend:imdt-qcs8550-sbc := "${DEPLOY_DIR_IMAGE}/ota-scripts:"

SRC_URI:imdt-qcs8550-sbc = " \
    file://sw-description \
    file://update.sh \
"

# Enable the creation of OTA Recovery image
ENABLE_RECOVERY = "1"

# Dependencies to build before creating the SWUpdate image
IMAGE_DEPENDS += "\
    imdt-image-weston \
    packagegroup-qti-recoveryfs \
"

SWUPDATE_IMAGES:imdt-qcs8550-sbc = "ota-scripts/update_ext4.zip"

# recovery uses IMAGE_BASENAME (imdt-image-weston-swu) which contains wrong root files.
# Copy the imdt-image-weston files to the folder to be used by the recovery function.
# IMAGE_BASENAME cannot be changed because it overrides the image's files.
do_recovery_ext4:prepend:imdt-qcs8550-sbc() {
    cp -rf ${DEPLOY_DIR_IMAGE}/imdt-image-weston/*  ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}/
}

do_recovery_ext4[depends] += "imdt-image-weston:do_image_complete"
addtask do_recovery_ext4 after do_image

addtask do_recovery_ext4 before do_gen_ota_full_zip_ext4
addtask do_gen_ota_full_zip_ext4 before do_swuimage
