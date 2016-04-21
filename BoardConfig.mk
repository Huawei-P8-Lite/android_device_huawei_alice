#
# Copyright (C) 2015 The CyanogenMod Project
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

USE_OPENGL_RENDERER := true
ANDROID_ENABLE_RENDERSCRIPT := true
USE_CAMERA_STUB := true
BOARD_USES_GENERIC_AUDIO := false

# 1st Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_BOARD_GPU := mali-450mp
#TARGET_CPU_ABI2 :=

#2nd Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a7
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

#No radio
TARGET_NO_RADIOIMAGE := true

#Audio
BOARD_USES_ALSA_AUDIO := true

#RIL (temp not building because of errors)
#BOARD_RIL_CLASS := ../../../device/huawei/alice/ril/

# Wifi & Bluetooth
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4343
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4343s_hw.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4343s_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/fw_bcm4343s_p2p_hw.bin"
WIFI_BAND                        := 802_11_ABG
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := "device/huawei/alice/bluetooth"
BOARD_BLUEDROID_VENDOR_CONF := device/huawei/alice/bluetooth/vnd_hi6210sft.txt

# Media symbols > thank you codeworkx
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_huawei_symbols

TARGET_HARDWARE_3D := true
BOARD_EGL_CFG := device/huawei/alice/rootdir/system/lib/egl/egl.cfg
TARGET_BOARD_PLATFORM := hi6210sft

TARGET_CPU_SMP := true

TARGET_USES_64_BIT_BINDER := true
TARGET_USES_HISI_DTIMAGE := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

TARGET_BOOTLOADER_BOARD_NAME := hi6210sft
ANDROID_64=true

BOARD_KERNEL_CMDLINE := hisi_dma_print=0 vmalloc=384M maxcpus=8 coherent_pool=512K no_irq_affinity androidboot.selinux=permissive ate_enable=true
BOARD_KERNEL_BASE := 0x07478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x02988000

BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11605639168
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_KERNEL_CONFIG := hisi_hi6210sft_defconfig
TARGET_PREBUILT_KERNEL := device/huawei/alice/kernel

BOARD_HAS_NO_SELECT_BUTTON := true
DEVICE_RESOLUTION := 720x1280
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd_backlight0/brightness"
TW_CUSTOM_BATTERY_PATH := "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery"
TW_MAX_BRIGHTNESS := 255

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/huawei/alice/rootdir/fstab.hi6210sft
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_SPECIFIC_HEADER_PATH += device/huawei/alice/include

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/alice/bluetooth

# assert
TARGET_OTA_ASSERT_DEVICE := hi6210sft

#SeLinux
BOARD_SEPOLICY_DIRS += \
	device/huawei/alice/selinux

BOARD_SEPOLICY_UNION += \
	file_contexts \
	installd.te

# inherit from the proprietary version
-include vendor/huawei/alice/BoardConfigVendor.mk
