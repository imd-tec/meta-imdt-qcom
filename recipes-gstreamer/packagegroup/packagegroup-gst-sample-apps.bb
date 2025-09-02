DESCRIPTION = "Package group for GStreamer AI Demo Applications"
LICENCE = "CLOSED"
SUMMARY = "This package group adds all the GStreamer AI demo sample applications"
inherit packagegroup

RDEPENDS:${PN} = "  \
    gstreamer1.0-qti-oss-sample-apps-classification \
    gstreamer1.0-qti-oss-sample-apps-daisychain-detection-pose \
    gstreamer1.0-qti-oss-sample-apps-multistream-inference \
    gstreamer1.0-qti-oss-sample-apps-object-detection \
    gstreamer1.0-qti-oss-sample-apps-parallel-inference \
    gstreamer1.0-qti-oss-sample-apps-pose-detection \
    gstreamer1.0-qti-oss-sample-apps-segmentation \
"

# Models not being packaged as they don't run on the SBC8550
    # gstreamer1.0-qti-oss-sample-apps-daisychain-detection-classification \
    # gstreamer1.0-qti-oss-sample-apps-face-detection \
    # gstreamer1.0-qti-oss-sample-apps-face-recognition \
    # gstreamer1.0-qti-oss-sample-apps-monodepth \
    # gstreamer1.0-qti-oss-sample-apps-multi-input-output-object-detection \
    # gstreamer1.0-qti-oss-sample-apps-multistream-batch-inference \
    # gstreamer1.0-qti-oss-sample-apps-smartcodec-example \
    # gstreamer1.0-qti-oss-sample-apps-superresolution \
