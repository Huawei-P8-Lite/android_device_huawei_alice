# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from alice device
$(call inherit-product, device/huawei/alice/alice.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hi6210sft BUILD_FINGERPRINT=Huawei/hi6210sft/hwALE:4.4.2/HDALE-L21/CHNC00B310:user/ota-rel-keys,release-keys PRIVATE_BUILD_DESC="hi6210sft 4.4.2 KOT49H eng.jslave.20141208.235421 test-keys"

PRODUCT_NAME := aosp_alice
PRODUCT_DEVICE := alice
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on alice
PRODUCT_MANUFACTURER := huawei
PRODUCT_RESTRICT_VENDOR_FILES := false
