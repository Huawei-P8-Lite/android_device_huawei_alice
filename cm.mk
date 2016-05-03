# Inherit omni-specific board config
include device/huawei/alice/BoardConfigCM.mk

# Inherit base AOSP device configuration
$(call inherit-product, device/huawei/alice/aosp_alice.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Override product naming for CM
PRODUCT_NAME := cm_alice
PRODUCT_BRAND := huawei
PRODUCT_MODEL := CM on alice
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RESTRICT_VENDOR_FILES := false