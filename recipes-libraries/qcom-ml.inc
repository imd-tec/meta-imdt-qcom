HEXAGON_VERSION = "v73"
HEXAGON_DIR = "hexagon-${HEXAGON_VERSION}"
QNPSDK_SRC_VER="2.41.0.251128"
QNPSDK_SRC_SHID="c6306f7d70457e4d8736416bb406d8670f5186fb648dd6808db24e9b2176c28d"

def platform_dir(d, sdklibdir):
    gccversion  = d.getVar("GCCVERSION", True).strip('%').split('.')[0]
    gccversion_integer = int(gccversion)
    sdk_lib_dir = d.getVar(sdklibdir, True) + "/lib/"
    dir_prefix = "aarch64-oe-linux-gcc"
    for version in range (gccversion_integer, 8, -1):
        gccversion = str(version)
        pf_dir = dir_prefix + gccversion
        if os.path.exists(sdk_lib_dir) and os.path.isdir(sdk_lib_dir):
            for folder in os.listdir(sdk_lib_dir):
                if folder.startswith(pf_dir):
                    pf_dir += "*"
                    return pf_dir
