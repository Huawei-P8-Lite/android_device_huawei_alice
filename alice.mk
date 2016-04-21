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
LOCAL_PATH := device/huawei/alice

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
DEVICE_PACKAGE_OVERLAYS += device/huawei/alice/overlay

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
	
# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh uim wpa_supplicant

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Build BT a2dp audio HAL
PRODUCT_PACKAGES += audio.a2dp.default

# Needed to sync the system clock with the RTC clock
PRODUCT_PACKAGES += hwclock

# Include USB speed switch App
PRODUCT_PACKAGES += UsbSpeedSwitch

# Build libion for new double-buffering HDLCD driver
PRODUCT_PACKAGES += libion

# Build gatord daemon for DS-5/Streamline
PRODUCT_PACKAGES += gatord

# Build gralloc for Juno
PRODUCT_PACKAGES += gralloc.hi6210sft

# Include ION tests
# Removed error on OMNIRom
#PRODUCT_PACKAGES += iontest \
#                    ion-unit-tests

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote64_32
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_PACKAGES += libGLES_android

# Include BT modules
$(call inherit-product-if-exists, hardware/ti/wpan/ti-wpan-products.mk)


PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
        $(LOCAL_PATH)/bt-wifi-firmware-util/TIInit_11.8.32.bts:system/etc/firmware/ti-connectivity/TIInit_11.8.32.bts \
        $(LOCAL_PATH)/bt-wifi-firmware-util/TIInit_11.8.32.bts:system/etc/firmware/TIInit_11.8.32.bts \
        $(LOCAL_PATH)/bt-wifi-firmware-util/wl18xx-fw-4.bin:system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin \
        $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
		
		
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

#RIL
#PRODUCT_PROPERTY_OVERRIDES += \
#audioril.lib=libhuawei-audio-ril.so \
#ro.telephony.ril_class=HuaweiRIL \
#telephony.lteOnCdmaDevice=0 \
#telephony.lteOnGsmDevice=1 \
#ro.telephony.default_network=9

#Audio Config
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf


#Bluetooth
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
$(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
$(LOCAL_PATH)/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf


#Media patches
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
$(LOCAL_PATH)/media/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml

PRODUCT_PACKAGES += \
audio.primary.default \
audio_policy.stub \
audio.a2dp.default \
audio.usb.default \
audio.r_submix.default \
libaudioutils \
libtinyalsa \
tinyplay \
tinycap \
tinymix \
tinypcminfo \
sound_trigger.primary.hi6210sft \
camera.default \
libion.huawei

#NFCEE_ACCESS_PATH := vendor/etc/nfcee_access.xml
#PRODUCT_COPY_FILES += \
#	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml	

# Include non-opensource parts
$(call inherit-product, vendor/huawei/alice/device-vendor.mk)
