#
# Copyright (c) 2024 IMD Technologies
#

# QTI Linux robotics image file.
# Provides packages required to build an image with
# robotics features support.

CORE_IMAGE_EXTRA_INSTALL:append = " helloworld"
CORE_IMAGE_EXTRA_INSTALL:append = " nano"
CORE_IMAGE_EXTRA_INSTALL:append = " python3-pip"
CORE_IMAGE_EXTRA_INSTALL:append = " python3-setuptools"
CORE_IMAGE_EXTRA_INSTALL:append = " htpdate"
