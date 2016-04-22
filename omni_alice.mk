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

# Inherit omni-specific board config
include $(LOCAL_PATH)/BoardConfigOmni.mk

# Inherit base AOSP device configuration
$(call inherit-product, $(LOCAL_PATH)/aosp_alice.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Allow tethering without provisioning app
#PRODUCT_PROPERTY_OVERRIDES += \
#    net.tethering.noprovisioning=true

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Override product naming for Omni
PRODUCT_NAME := omni_alice
PRODUCT_BRAND := huawei
PRODUCT_MODEL := Omni on alice
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RESTRICT_VENDOR_FILES := false
