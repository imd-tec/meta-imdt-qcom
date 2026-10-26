PACKAGECONFIG:append:imdt-qcs8550-sbc = " networkd"
PACKAGECONFIG:append:imdt-qcs8550-sbc = " resolved"

# This rule is not needed on any LE platform since Qualcomm don't provide
# an mtpserver
SRC_URI:remove = "file://mtpserver.rules"
