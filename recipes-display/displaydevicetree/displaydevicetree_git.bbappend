#
# Copyright (c) 2025 IMD Technologies
#
# Automatically generated file

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patches for qcom-display-devicetree
SRC_URI:append:imdt-qcs8550-sbc = " file://0001-Initial-bringup-of-IMDT-Display-3.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0002-Change-Backlight-Pin-and-Clean-Temp-nodes.-8.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0003-Enable-PWM-Display-Backlight-on-PM8550-GPIO6-9.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0004-Configure-PWM-backlight-through-DSI-PWM-pinctrl-node.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0005-Remove-unnecessary-display-power-supply-nodes-and-en.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0006-Enable-displayport-via-USB-C-altmode-driver.patch"
SRC_URI:append:imdt-qcs8550-sbc = " file://0007-Seperate-SBC8550-rev3-and-rev5-into-individual-board.patch"
