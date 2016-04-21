# Inherit omni-specific board config
include device/huawei/alice/BoardConfigOmni.mk

# Inherit base AOSP device configuration
$(call inherit-product, device/huawei/alice/aosp_alice.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)

# Allow tethering without provisioning app
#PRODUCT_PROPERTY_OVERRIDES += \
#    net.tethering.noprovisioning=true

# Override product naming for Omni
PRODUCT_NAME := omni_alice
PRODUCT_BRAND := huawei
PRODUCT_MODEL := Omni on alice
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RESTRICT_VENDOR_FILES := false
