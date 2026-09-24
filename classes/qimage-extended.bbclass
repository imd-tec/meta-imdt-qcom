inherit qimage

do_update_recovery_ext4_with_nonhlos() {
    RADIO_TARGET_DIR=${OTA_TARGET_IMAGE_ROOTFS_EXT4}/RADIO

    # Copy NON-HLOS binaries into the Android OTA package
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/xbl_s.melf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/xbl_config.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/XblRamdump.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/uefi.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/imagefv.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/SocPkg/Kailua/Bin/LAA/RELEASE/shrm.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/Tools/binaries/logfs_ufs_8mb.bin ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/boot_images/boot/QcomPkg/QcomToolsPkg/Bin/QcomTools/RELEASE/tools.fv ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/aop_proc/build/ms/bin/AAAAANAZO/kailua/aop.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/aop_proc/build/ms/bin/AAAAANAZO/kailua/aop_devcfg.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/trustzone_images/build/ms/bin/KALIONAA/tz.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/trustzone_images/build/ms/bin/KALIONAA/devcfg.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/trustzone_images/build/ms/bin/KALIONAA/hypvm.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/cpucp_proc/kailua/cpucp/cpucp.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/build/ufs/bin/BTFM.bin ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/build/ufs/zeros_5sectors.bin ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/build/bin/dspso.bin ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/build/bin/multi_image.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/config/qti_misc/multi_image_qti.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/common/core_qupv3fw/kailua/qupv3fw.elf ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/qtee_tas/build/ms/bin/KALIONAA/featenabler.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/qtee_tas/build/ms/bin/KALIONAA/storsec.mbn ${RADIO_TARGET_DIR}
    cp ${QCOM_ROOT_DIR}/qtee_tas/build/ms/bin/KALIONAA/uefi_sec.mbn ${RADIO_TARGET_DIR}
    cp ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}/abl.elf ${RADIO_TARGET_DIR}
    
    # We delete the existing zip created in do_update_recovery_ext4
    # as we want to create a new zip with all the NON-HLOS binaries
    rm -f ${OTA_TARGET_FILES_EXT4_PATH}
    cd ${OTA_TARGET_IMAGE_ROOTFS_EXT4} && zip -qry ${OTA_TARGET_FILES_EXT4_PATH} *
}

# We detach the generation of the OTA recovery image and zip file from the
# main Yocto build dependency chain so that these tasks have to be explicitly executed
# to generate them (like the do_populate_sdk task).
deltask do_recovery_ext4
deltask do_gen_ota_full_zip_ext4

addtask do_recovery_ext4 after do_image_complete
addtask do_update_recovery_ext4_with_nonhlos after do_recovery_ext4
addtask do_gen_ota_full_zip_ext4 after do_update_recovery_ext4_with_nonhlos
