# Various mount related files assume selinux support by default.
# Explicitly remove sepolicy entries when selinux is not present.
# We override this function as it tries to find vm-bootsys.mount
# and vm-bootsys-mount.service which we don't have in our images.
fix_sepolicies () {
    sed -i "s#,context=system_u:object_r:firmware_t:s0##g" ${WORKDIR}/firmware.mount
    sed -i "s#,context=system_u:object_r:firmware_t:s0##g" ${WORKDIR}/firmware-mount.service
    sed -i "s#,context=system_u:object_r:firmware_t:s0##g" ${WORKDIR}/bt_firmware.mount
    sed -i "s#,context=system_u:object_r:firmware_t:s0##g" ${WORKDIR}/bt_firmware-mount.service
    sed -i "s#,context=system_u:object_r:adsprpcd_t:s0##g" ${WORKDIR}/dsp-mount.service
    sed -i "s#,rootcontext=system_u:object_r:data_t:s0##g" ${WORKDIR}/data.mount
    sed -i "s#,rootcontext=system_u:object_r:persist_t:s0##g" ${WORKDIR}/persist.mount
    sed -i "s#,rootcontext=system_u:object_r:system_data_t:s0##g" ${WORKDIR}/systemrw.mount

    # TODO: figure out the selinux context for the overlays
    sed -i "s#,rootcontext=system_u:object_r:overlay_t:s0##g" ${WORKDIR}/overlay.mount
    sed -i "s#,rootcontext=system_u:object_r:etc_t:s0##g" ${WORKDIR}/overlay-etc.mount
    sed -i "s#,rootcontext=system_u:object_r:data_t:s0##g" ${WORKDIR}/overlay-data.mount
    sed -i "s#,rootcontext=system_u:object_r:cache_t:s0##g" ${WORKDIR}/overlay-cache.mount
    sed -i "s#,context=system_u:object_r:lib_t:s0##g" ${WORKDIR}/qti-mount-generator
}
