#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from BQru-5745L device
$(call inherit-product, device/bqru/BQru-5745L/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := BQru-5745L
PRODUCT_NAME := omni_BQru-5745L
PRODUCT_BRAND := BQru
PRODUCT_MODEL := BQ-5745L
PRODUCT_MANUFACTURER := BQru
PRODUCT_RELEASE_NAME := BQru 5745L


PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=BQru-5745L \
    PRODUCT_NAME=BQru-5745L \
    PRIVATE_BUILD_DESC="BQru-5745L user 10 QP1A.190711.020 48516 release-keys"

BUILD_FINGERPRINT := BQru/BQru-5745L/BQru-5745L:10/QP1A.190711.020/48215:user/release-keys
