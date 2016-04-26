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
PRODUCT_AAPT_CONFIG := xhdpi hdpi normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# A list of dpis to select prebuilt apk, in precedence order (from omnirom/angler)
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    hw.lcd.lcd_density=320

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Ramdisk
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/rootdir/fstab.hi6210sft:root/fstab.hi6210sft \
    $(LOCAL_PATH)/rootdir/init.hi6210sft.rc:root/init.hi6210sft.rc \
    $(LOCAL_PATH)/rootdir/init.hi6210sft.usb.rc:root/init.hi6210sft.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc 

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/rootdir/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote64_32
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

# Selinux settings
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.boot.selinux=0
ADDITIONAL_DEFAULT_PROPERTIES      += ro.boot.selinux=0

# testing
PRODUCT_PACKAGES += \
    libGLES_android \
    libion \
	libion.huawei

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    persist.sys.use_dithering=2 \
    persist.sys.strictmode.disable=1

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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    OmniTorch \
    com.android.future.usb.accessory

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes \
    ro.config.ntp.server_poll=86400000 \
    ro.config.ntp.clock_sync=1800000 \
    ro.config.ntp.sync_mode=3 \
    fw.appops.sys_app=true \
    android.webview.force_aosp=false

	
# Include non-opensource parts
$(call inherit-product, vendor/huawei/alice/device-vendor.mk)
