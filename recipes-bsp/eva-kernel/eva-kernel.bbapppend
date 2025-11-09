#
# Copyright (c) 2025 IMD Technologies
#

# We override Qualcomm's do_compile task for this recipe
# because it incorrectly passes KBUILD_EXTRA_SYMBOLS to the build_module.sh script.
# And then it silently builds the kernel module with the wrong symbol file. 
# The kernel module then fails to load on the device due to the mismatched symbols:
# msm-eva.ko: disagrees about version of symbol module_layout
do_compile() {
    echo "WORKDIR path -> " ${WORKDIR}
    echo "D path -> " ${D}
    echo "base_libdir path -> " ${base_libdir}
    echo "STAGING_DIR_HOST path -> " ${STAGING_DIR_HOST}
    echo "KERNEL_VERSION -> " ${KERNEL_VERSION}
    echo "COMPONENTS_DIR -> " ${COMPONENTS_DIR}
    echo "MMRM SYMVERS PATH -> " ${COMPONENTS_DIR}/aarch64/mmrm-kernel${base_libdir}/modules/${KERNEL_VERSION}/
    cd ${KERNEL_PLATFORM_PATH}
    BUILD_CONFIG=msm-kernel/${KERNEL_CONFIG} \
    KERNEL_KIT=${KERNEL_PREBUILT_PATH} \
    OUT_DIR=${WORKDIR}/kernel-5.15/out/${KERNEL_DEFCONFIG} \
    EXT_MODULES=${EXT_MODULES} \
    ROOTDIR=${WORKDIR}/ \
    INPLACE_COMPILE=y \
    MODULE_OUT=${WORKDIR}/vendor/qcom/opensource/eva-kernel \
    KERNEL_UAPI_HEADERS_DIR=${STAGING_KERNEL_BUILDDIR} \
    ./build/build_module.sh \
    KBUILD_EXTRA_SYMBOLS="${COMPONENTS_DIR}/aarch64/mmrm-kernel${base_libdir}/modules/${KERNEL_VERSION}/Module.symvers"
}
