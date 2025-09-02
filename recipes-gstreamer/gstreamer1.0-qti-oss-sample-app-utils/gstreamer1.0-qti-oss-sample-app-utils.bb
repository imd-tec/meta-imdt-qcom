#
# Copyright (c) 2025 IMD Technologies
#
SUMMARY = "Generic ref sample apps for GStreamer pipelines."
SECTION = "multimedia"

inherit cmake pkgconfig

LICENSE = "BSD-3-Clause-Clear"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=7a434440b651f4a472ca93716d01033a"

DEPENDS:append = " gstreamer1.0"
DEPENDS:append = " glib-2.0"

FILESPATH =+ "${WORKSPACE}/vendor/qcom/opensource/gst-plugins-qti-oss/gst-sample-apps:"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://gst-sample-apps-utils \
           file://0001-Export-sample-app-utils.patch;patchdir=${WORKDIR}"

S = "${WORKDIR}/gst-sample-apps-utils"

INSTALL_BINDIR := "${bindir}"
INSTALL_LIBDIR := "${libdir}"
INSTALL_INCDIR := "${includedir}"

EXTRA_OECMAKE += "-DGST_VERSION_REQUIRED=1.14.4"
EXTRA_OECMAKE += "-DSYSROOT_INCDIR=${STAGING_INCDIR}"
EXTRA_OECMAKE += "-DSYSROOT_LIBDIR=${STAGING_LIBDIR}"
EXTRA_OECMAKE += "-DGST_PLUGINS_QTI_OSS_INSTALL_BINDIR=${INSTALL_BINDIR}"
EXTRA_OECMAKE += "-DGST_PLUGINS_QTI_OSS_INSTALL_LIBDIR=${INSTALL_LIBDIR}"

FILES:${PN} += "${INSTALL_BINDIR}"
FILES:${PN} += "${INSTALL_LIBDIR}"
FILES:${PN} += "${INSTALL_INCDIR}"
