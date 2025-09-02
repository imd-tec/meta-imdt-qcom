#
# Copyright (c) 2025 IMD Technologies
#
SUMMARY = "GStreamer AI Sample Applications"
SECTION = "multimedia"

inherit cmake pkgconfig dos2unix

LICENSE = "BSD-3-Clause-Clear"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=7a434440b651f4a472ca93716d01033a"

FILESPATH =+ "${WORKSPACE}/vendor/qcom/opensource/gst-plugins-qti-oss:"

SRC_URI = "file://gst-sample-apps \
           file://0001-Make-AI-demos-build-correctly-in-yocto.patch;patchdir=${WORKDIR}"

OECMAKE_SOURCEPATH="${S}/gst-sample-apps"
S = "${WORKDIR}"

DEPENDS += "glib-2.0"
DEPENDS += "json-glib"
DEPENDS += "gstreamer1.0"
DEPENDS += "gstreamer1.0-qti-oss-sample-app-utils"
DEPENDS += "gstreamer1.0-plugins-base"

INSTALL_BINDIR := "${bindir}"
INSTALL_LIBDIR := "${libdir}"
INSTALL_INCDIR := "${includedir}"
INSTALL_OPTDIR := "opt"

EXTRA_OECMAKE += "-DGST_VERSION_REQUIRED=1.14.4"
EXTRA_OECMAKE += "-DSYSROOT_INCDIR=${STAGING_INCDIR}"
EXTRA_OECMAKE += "-DSYSROOT_LIBDIR=${STAGING_LIBDIR}"
EXTRA_OECMAKE += "-DGST_PLUGINS_QTI_OSS_INSTALL_BINDIR=${INSTALL_BINDIR}"
EXTRA_OECMAKE += "-DGST_PLUGINS_QTI_OSS_INSTALL_LIBDIR=${INSTALL_LIBDIR}"

PACKAGES =+ "${PN}-classification \
             ${PN}-daisychain-detection-classification \
             ${PN}-daisychain-detection-pose \
             ${PN}-face-detection \
             ${PN}-face-recognition \
             ${PN}-monodepth \
             ${PN}-multi-input-output-object-detection \
             ${PN}-multistream-batch-inference \
             ${PN}-multistream-inference \
             ${PN}-object-detection \
             ${PN}-parallel-inference \
             ${PN}-pose-detection \
             ${PN}-segmentation \
             ${PN}-smartcodec-example \
             ${PN}-superresolution"

python __anonymous() {
    pkgs = d.getVar("PACKAGES", True).split()
    for pkg in pkgs:
        module = pkg.replace("gstreamer1.0-qti-oss-sample-apps-", "")
        d.appendVar("FILES:%s" % pkg, " ${INSTALL_BINDIR}/gst-ai-%s" % module)
}

# Overridden function from dos2unix.bbclass. Executes after do_fetch.
# gst-ai-daisychain-detection-classification/config_daisychain_detection_classification.json has CRLF line endings which are handled
# badly by the patching process, so to make life easier we convert it and any patches generated from it to LF line endings.
do_convert_crlf_to_lf () {
    dos2unix ${S}/gst-sample-apps/gst-ai-daisychain-detection-classification/config_daisychain_detection_classification.json
    find ${S} -type f -name "*.patch" -exec dos2unix {} \;
}

FILES:${PN}-classification += "${INSTALL_OPTDIR}/config_classification.json"
FILES:${PN}-daisychain-detection-classification += "${INSTALL_OPTDIR}/config_daisychain_detection_classification.json"
FILES:${PN}-monodepth += "${INSTALL_OPTDIR}/config_monodepth.json"
FILES:${PN}-object-detection += "${INSTALL_OPTDIR}/config_detection.json"
FILES:${PN}-pose-detection += "${INSTALL_OPTDIR}/config_pose.json"
FILES:${PN}-segmentation += "${INSTALL_OPTDIR}/config_segmentation.json"

INSANE_SKIP:${PN} += " file-clash already-stripped"
ALLOW_EMPTY:${PN} = "1"
