#
# Copyright (c) 2026 IMD Technologies
#

SUMMARY     = "RTC time-control utility via time-genoff API"
DESCRIPTION = "Provides rtc_time_control, a command-line tool to get/set rtc \
time through the Qualcomm time-genoff daemon using the ATS_TOD_GEN base. \
Requires time_daemon to be running on the target."

LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Proprietary;md5=0557f9d92cf58f2ccdd50f62f8ac0b28"

PR = "r0"

SRC_URI = "file://rtc-time-control-1.0.tar.gz;md5sum=429f84f02fde22c54c0a868eefe12082"

S = "${WORKDIR}/rtc-time-control-1.0"

inherit cmake pkgconfig

DEPENDS = "time-services glib-2.0"
RDEPENDS:${PN} = "time-services"

EXTRA_OECMAKE = "-DTIME_SERVICES_INCLUDE_DIR=${WORKSPACE}/time-services"

FILES:${PN} += "${bindir}/rtc_time_control"
