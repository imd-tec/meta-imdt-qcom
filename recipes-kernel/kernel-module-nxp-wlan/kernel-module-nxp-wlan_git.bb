SUMMARY = "NXP Wi-Fi driver for modules 88w8801/8987/8997/9098 (IW416/IW610/IW612)"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit linux-kernel-base deploy

SRCBRANCH = "lf-6.12.49_2.2.0"
SRCREV = "84ca65c9ff935d7f2999af100a82531c22c65234"

MRVL_SRC ?= "git://github.com/nxp-imx/mwifiex.git;protocol=https"
SRC_URI = "\
    ${MRVL_SRC};branch=${SRCBRANCH} \
    file://0001-mxm_wifiex-support-building-using-Qualcomm-s-build-m.patch \
    file://0002-mxm_wifiex-support-building-against-msm-kernel-v5.15.patch \
    file://0003-mxm_wifiex-add-support-for-autoloading-SDIO-drivers.patch \
"

S = "${WORKDIR}/git"

KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"

do_configure[noexec] = "1"

do_compile[depends] += "virtual/kernel:do_shared_workdir"
do_compile[cleandirs] += "${S}/out/${KERNEL_DEFCONFIG}"

do_compile() {
    cd ${KERNEL_PLATFORM_PATH}
    BUILD_CONFIG=msm-kernel/${KERNEL_CONFIG} \
    EXT_MODULES=${@os.path.relpath("${S}", "${KERNEL_PLATFORM_PATH}")} \
    MODULE_OUT=${S} \
    INPLACE_COMPILE=y \
    KERNEL_KIT=${KERNEL_PREBUILT_PATH} \
    OUT_DIR=${S}/out/${KERNEL_DEFCONFIG} \
    KERNEL_UAPI_HEADERS_DIR=${STAGING_KERNEL_BUILDDIR} \
    ./build/build_module.sh
}

do_install() {
	install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/

    install -m 0755 ${S}/mlan.ko ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/
    install -m 0755 ${S}/moal.ko ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/
}

do_deploy() {
    install -d ${DEPLOYDIR}/kernel_modules

    install -m 0755 ${S}/mlan.ko ${DEPLOYDIR}/kernel_modules
    install -m 0755 ${S}/moal.ko ${DEPLOYDIR}/kernel_modules
}

addtask do_deploy after do_install

RDEPENDS:${PN} += "imx-wifi-firmware"
FILES:${PN}:append = " ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/*"
