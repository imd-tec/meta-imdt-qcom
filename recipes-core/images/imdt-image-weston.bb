#
# Copyright (c) 2024 IMD Technologies
#

inherit qimage populate_sdk_qti

IMAGE_FEATURES:append    = " ssh-server-openssh"
SDKIMAGE_FEATURES:append = " dev-pkgs staticdev-pkgs dbg-pkgs"

# mmrm-kernel is only a DEPENDS for the camera-kernel driver. 
# It needs to be added as RDEPENDS as well if you want
# the package to exist on the final rootfs.
CORE_IMAGE_EXTRA_INSTALL += "\
    glib-2.0 \
    kernel-modules \
    gki-kernel-modules-second-stage \
    systemd-machine-units \
    packagegroup-android-utils \
    packagegroup-startup-scripts \
    packagegroup-support-utils \
    packagegroup-filesystem-utils \
    i2c-tools \
    libgpiod \
    libgpiod-tools \
    lsb-release \
    camxoverridesettings \
    packagegroup-qti-core \
    packagegroup-qti-core-prop \
    packagegroup-qti-camera \
    packagegroup-qti-camera-kernel \
    packagegroup-qti-qmmf \
    packagegroup-qti-mmframeworks \
    packagegroup-qti-sensors-ship \
    packagegroup-qti-dsp \
    packagegroup-qti-fastcv \
    packagegroup-qti-video \
    packagegroup-qti-display \
    packagegroup-qti-eva \
    packagegroup-qti-gst \
    packagegroup-gst-sample-apps \
    packagegroup-qti-gfx \
    packagegroup-mesa \
    gbm \
    libdrm \
    mmdlkm \
    mmrm-kernel \
    mmrm-devicetree \
    displaydlkm \
    mmdevicetree \
    libdmabufheap \
    yavta \
    sensor-service \
    sensor-client \
    hibernate     \
    qmi-framework \
    qti-c2-module \
    tensorflow-lite \
    qnn \
    snpe \
    nano \
    opencv \
    pciutils \
    adsp-boot-service \
    packagegroup-qti-audio \
    audio-init-service \
    linux-firmware-ath11k \
    wpa-supplicant \
    iw \
    iperf3 \
"

# To speed up the build we don't bother creating OTA Recovery image 
do_recovery_ext4[noexec] = "1"
do_gen_ota_full_zip_ext4[noexec] = "1"
