#!/bin/bash

function create_adsp_lib_symlink() {
    # We have to create this symlink because the SSC RPC Daemon will
    # try to load libssc_default_listener.so if it sees /sys/kernel/boot_slpi
    # instead of /sys/kernel/boot_adsp
    if [ -e "/sys/kernel/boot_slpi/boot" ] && [ ! -e "/usr/lib/libssc_default_listener.so" ]; then
        mount -o remount, rw /
        ln -sf /usr/lib/libadsp_default_listener.so /usr/lib/libssc_default_listener.so
    fi
}

function boot_adsp() {
    if [ -e "/sys/kernel/boot_slpi/boot" ]; then
        echo 1 > /sys/kernel/boot_slpi/boot
    elif [ -e "/sys/kernel/boot_adsp/boot" ]; then
        echo 1 > /sys/kernel/boot_adsp/boot
    fi
}

create_adsp_lib_symlink
boot_adsp
