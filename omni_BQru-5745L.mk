#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from BQru-5745L device
$(call inherit-product, device/bqru/BQru-5745L/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := BQru-5745L
PRODUCT_NAME := omni_BQru-5745L
PRODUCT_BRAND := BQru
PRODUCT_MODEL := BQru
PRODUCT_MANUFACTURER := bqru
PRODUCT_RELEASE_NAME := BQru 5745L


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="BQru-5745L user 10 QP1A.190711.020 48516 release-keys"

BUILD_FINGERPRINT := BQru/BQru-5745L/BQru-5745L:10/QP1A.190711.020/48215:user/release-keys
