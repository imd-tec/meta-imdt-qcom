#
# Copyright (c) 2025 IMD Technologies
#

BSP_MANIFEST_FILE_PATTERN = "imdt-qcom-bsp-*.xml"
DEVELOPMENT_MANIFEST_FILE_PATTERN = "develop*.xml"

FILESEXTRAPATHS:prepend := "${TOPDIR}/../.repo:"
SRC_URI:append = " file://local_manifests"

def get_bsp_name(d):
    from pathlib import Path
    import xml.etree.ElementTree as ET
    import glob
    import os

    DEFAULT_BSP_VERSION = "UNKNOWN"
    DEFAULT_BSP_NAME    = "UNKNOWN"

    manifest_path = Path(d.getVar("WORKDIR")).joinpath("local_manifests")
    if not manifest_path.exists():
        return f"{DEFAULT_BSP_NAME}-{DEFAULT_BSP_VERSION}"

    file_pattern = d.getVar("BSP_MANIFEST_FILE_PATTERN")
    bsp_manifest_list = glob.glob(os.path.join(manifest_path, file_pattern))

    file_pattern = d.getVar("DEVELOPMENT_MANIFEST_FILE_PATTERN")
    develop_manifest_list = glob.glob(os.path.join(manifest_path, file_pattern))

    manifest_count = len(bsp_manifest_list) + len(develop_manifest_list)

    if manifest_count == 0:
        bb.note("No manifests matching BSP or development manifest file pattern")
        return f"{DEFAULT_BSP_NAME}-{DEFAULT_BSP_VERSION}"
    elif manifest_count > 1:
        bb.note("Multiple manifests found matching the file patterns")
        return f"{DEFAULT_BSP_NAME}-{DEFAULT_BSP_VERSION}"

    selected_manifest = bsp_manifest_list[0] if bsp_manifest_list else develop_manifest_list[0]
    manifest_xml_root = ET.parse(selected_manifest).getroot()

    bsp_name    = manifest_xml_root.attrib.get("name",    DEFAULT_BSP_NAME)
    bsp_version = manifest_xml_root.attrib.get("version", DEFAULT_BSP_VERSION)

    return f"{bsp_name}-{bsp_version}"
    

do_install() {

    oe_runmake install prefix=${D}${root_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}

    mkdir -p ${D}${sysconfdir}/lsb-release.d

    echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
    echo "DISTRIB_RELEASE=${@get_bsp_name(d)}-${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release

    if [ -n "${DISTRO_CODENAME}" ]; then
        echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
    fi

    echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${@get_bsp_name(d)} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
}


