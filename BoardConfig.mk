#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := device/huawei/alice

# 64 Bit
ANDROID_64=true
TARGET_USES_64_BIT_BINDER := true

# Architecture
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_SMP := true
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Assert
TARGET_OTA_ASSERT_DEVICE := hi6210sft,alice

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Blobs
-include vendor/huawei/alice/BoardConfigVendor.mk

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi6210sft
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

# Board
BOARD_VENDOR_PLATFORM := hi6210sft
TARGET_BOARD_PLATFORM := hi6210sft

# Camera
USE_CAMERA_STUB := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true

# CMHW
BOARD_HARDWARE_CLASS := \
    	$(LOCAL_PATH)/cmhw \
    	hardware/cyanogen/cmhw

# CPU
ENABLE_CPUSETS := true

# Display
TARGET_USE_PAN_DISPLAY := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Graphics
ANDROID_ENABLE_RENDERSCRIPT := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 6
TARGET_BOARD_GPU := mali-450mp
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_HARDWARE_3D := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Kernel
BOARD_KERNEL_BASE := 0x07478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := hisi_dma_print=0 vmalloc=384M maxcpus=8 coherent_pool=512K no_irq_affinity ate_enable=true androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x02988000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_IMAGE_NAME := Image

TARGET_KERNEL_CONFIG := alice_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/alice

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn547
NXP_CHIP_TYPE := 1

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11605639168
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.hi6210sft
TARGET_RECOVERY_DEVICE_MODULES := libinit_hi6210sft

# RIL
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/huawei/alice/ril
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := proprietary

# WebGL
ENABLE_WEBGL := true

# UserIMAGES
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Vendor
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hi6210sft
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_alice.cpp

# Wifi
WPA_SUPPLICANT_VERSION          := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_HOSTAPD_DRIVER 		:= NL80211
CONFIG_DRIVER_NL80211		:= y
