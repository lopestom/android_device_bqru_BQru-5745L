#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), BQru_5745L)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
