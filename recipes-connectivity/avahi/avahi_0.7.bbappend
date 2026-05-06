# Qualcomm avahi recipe fails do_package_qa
# due to some files being installed but not shipped
FILES:${PN} += "/run"
FILES:${PN} += "/usr/lib/avahi"
