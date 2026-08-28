FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " file://msm-hw-fence.conf"

do_install:append() {
    install -m 0755 ${WORKDIR}/msm-hw-fence.conf -D ${D}${sysconfdir}/modprobe.d/msm-hw-fence.conf
}
