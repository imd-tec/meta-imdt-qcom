#
# Copyright (c) 2024 IMD Technologies
#

# IMDT NOTE: Made this change to disable this feature.
# This is because this plugin expects to use a new version of
# the codec library which has android::C2HandleBuf.
# So we get --> error: no type named 'C2HandleBuf' in namespace 'android'
# As a temporary workaround, we simply disable this feature for now!
ENABLE_LINEAR_DMABUF:kalama := "FALSE"
