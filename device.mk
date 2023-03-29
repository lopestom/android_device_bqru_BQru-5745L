#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

LOCAL_PATH := device/bqru/BQru_5745L

# use PRODUCT_SHIPPING_API_LEVEL indicates the first api level,and contorl treble macro
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

BOARD_VNDK_VERSION := current

#For Dynamic Partitions feature
PRODUCT_USE_DYNAMIC_PARTITIONS :=true

# add vndk version
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.vndk.version = 1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.usb.controller=musb-hdrc.0.auto

#fs doesn't have HEH filename encryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@1.0-impl

# Fastbootd and fastboot HAL
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-unisoc.service \

#Add for android  gatekeeper HDIL
#DEVICE_MANIFEST_FILE += $(LOCAL_PATH)/manifest_gatekeeper.xml
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    gatekeeper.default

PRODUCT_PACKAGES += \
    gatekeeperd \
    libkeystore \
    libgatekeeper \

PRODUCT_PACKAGES += \
    libtrusty \
    libteeproduction

PRODUCT_PACKAGES += \
    sprdstorageproxyd \
    rpmbserver


#ifneq ($(BOARD_TEE_LOW_MEM),true)
PRODUCT_PACKAGES += \
    tsupplicant
#endif

#add for check keymaster & widevine keybox lib
PRODUCT_PACKAGES += libcheckkeybox

PRODUCT_PACKAGES += \
   SoterService \
   libsoter_trusty \
   vendor.sprd.hardware.soter@1.0-service


# TRUSTY_SEPOLICY_DIR :=vendor/sprd/proprietories-source/sprdtrusty/vendor/sprd/modules/common/sepolicy_androidq
# BOARD_SEPOLICY_DIRS += $(TRUSTY_SEPOLICY_DIR)



# HIDL
# DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
#DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
# DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest_soter.xml



#TUI relevant
## ifeq ($(strip $(BOARD_TUI_CONFIG)), true)
#PRODUCT_PACKAGES += \
#  tuica \
#  libconfirmationui \
#  android.hardware.confirmationui@1.0-service \
#  tuiwakelock \
#  vendor.sprd.hardware.tuistate@1.0-service
 

