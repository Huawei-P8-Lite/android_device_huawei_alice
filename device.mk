#
# Copyright (C) 2015 The Android Open-Source Project
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

LOCAL_PATH := device/huawei/alice

# Screen density
PRODUCT_AAPT_PREF_CONFIG := 294dpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Ramdisk
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/rootdir/fstab.hi6210sft:root/fstab.hi6210sft \
    $(LOCAL_PATH)/rootdir/init.hi6210sft.rc:root/init.hi6210sft.rc \
    $(LOCAL_PATH)/rootdir/init.hi6210sft.usb.rc:root/init.hi6210sft.usb.rc \
    $(LOCAL_PATH)/rootdir/init.connectivity.gps.rc:root/init.connectivity.gps.rc \
    $(LOCAL_PATH)/rootdir/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc 

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/rootdir/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote64_32
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf
	
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.stub \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    sound_trigger.primary.hi6210sft \
    libaudioutils \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libnetcmdiface \
    libwpa_client \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Device state monitor
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/rootdir/system/etc/device_state_monitor.conf:system/etc/device_state_monitor.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/rootdir/system/etc/gpsconfig.xml:system/etc/gpsconfig.xml

# Lights
PRODUCT_PACKAGES += \
    lights.default

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/system/etc/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    $(LOCAL_PATH)/rootdir/system/etc/vdec_atlas.cfg:system/etc/vdec_atlas.cfg \
    $(LOCAL_PATH)/rootdir/system/etc/topazhp.cfg:system/etc/topazhp.cfg
	
#PRODUCT_PACKAGES += \
#    camera.default

#NFCEE_ACCESS_PATH := vendor/etc/nfcee_access.xml
#PRODUCT_COPY_FILES += \
#	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml	


# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/huawei/alice/device-vendor.mk)
