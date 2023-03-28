#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

DEVICE_PATH := device/bqru/BQru-5745L

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sp9863a_1h10_32b
#TARGET_NO_BOOTLOADER := true 
TARGET_NO_BOOTLOADER := false

# Platform
TARGET_BOARD_PLATFORM := sp9863a

# GPU
TARGET_GPU_PLATFORM := rogue

#SPRD: set property overrides split
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

BUILD_BROKEN_DUP_RULES := true

#boark NAME
#BOARD_NAME := sharkl3

# Assert
TARGET_OTA_ASSERT_DEVICE := BQru-5745L

# Kernel
#BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE := earlycon=sprd_serial,0x70100000,115200n8 console=ttyS1,115200n8 loglevel=1 init=/init root=/dev/ram0 rw androidboot.hardware=s9863a1h10_go_32b androidboot.dtbo_idx=0 printk.devkmsg=on androidboot.boot_devices=soc/soc:ap-ahb/20600000.sdio
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage

TARGET_KERNEL_ARCH := arm
#TARGET_KERNEL_HEADER_ARCH := arm

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

#for dynamic partitions feature
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_SIZE := 4299161600
BOARD_SUPER_PARTITION_GROUPS := group_unisoc
BOARD_GROUP_UNISOC_SIZE := 4299161600
BOARD_GROUP_UNISOC_PARTITION_LIST := system vendor product

# Crypto
TW_INCLUDE_CRYPTO := false
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Hack: prevent anti rollback
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

#creates the metadata directory
BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# For debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true

# Show build time on the splash screen
TW_DEVICE_VERSION=$(shell date '+%Y%m%d')

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_NO_SCREEN_TIMEOUT := true
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 190
TW_EXTRA_LANGUAGES := false
#TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_NTFS_3G := true


# ?? Need confirm
HAVE_SELINUX := true

#FOR Verified Boot
#1.0|2.0
PRODUCT_VBOOT := V2
BOARD_AVB_ENABLE := true

#config key&version for vbmeta
BOARD_AVB_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_KEY_PATH:=$(CONFIG_PATH)/rsa4096_vbmeta.pem
BOARD_AVB_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_vbmeta/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_vbmeta=//gp' )

#config key&version for boot
BOARD_AVB_BOOT_KEY_PATH:=$(CONFIG_PATH)/rsa4096_boot.pem
BOARD_AVB_BOOT_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_boot/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_boot=//gp' )
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION:=1

#config key&version for recovery
BOARD_AVB_RECOVERY_KEY_PATH:=$(CONFIG_PATH)/rsa4096_recovery.pem
BOARD_AVB_RECOVERY_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_boot/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_boot=//gp' )
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION:=2

#config key&version for system
BOARD_AVB_VBMETA_SYSTEM:=system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH:=$(CONFIG_PATH)/rsa4096_system.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_system/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_system=//gp' )
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION:=3

#config key&version for vendor
BOARD_AVB_VBMETA_VENDOR:= vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH:=$(CONFIG_PATH)/rsa4096_vendor.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_vendor/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_vendor=//gp' )
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION:=4

#config key&version for socko
BOARD_AVB_SOCKO_KEY_PATH:=$(CONFIG_PATH)/rsa4096_socko.pem
BOARD_AVB_SOCKO_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_SOCKO_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_socko/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_socko=//gp' )
BOARD_AVB_SOCKO_ROLLBACK_INDEX_LOCATION:=11

#config key&version for odmko
BOARD_AVB_ODMKO_KEY_PATH:=$(CONFIG_PATH)/rsa4096_odmko.pem
BOARD_AVB_ODMKO_ALGORITHM:=SHA256_RSA4096
BOARD_AVB_ODMKO_ROLLBACK_INDEX:=$(shell sed -n '/avb_version_odmko/p'  $(CONFIG_PATH)/version.cfg | sed -n 's/avb_version_odmko=//gp' )
BOARD_AVB_ODMKO_ROLLBACK_INDEX_LOCATION:=12
