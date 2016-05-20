# This file lists the firmware, software that are specific to
# WiLink connectivity chip on OMAPx platforms.

#PRODUCT_PACKAGES += uim \
#        libbt-vendor

# This file lists the firmware, software that are specific to
# WiLink connectivity chip on OMAPx platforms.

PRODUCT_PACKAGES += uim \
	kfmapp \
	FmRxApp \
	FmTxApp \
	FmService \
	libfmradio \
	fmradioif \
	com.ti.fm.fmradioif.xml \
	libbt-vendor \
	ti-wpan-fw \
	BluetoothSCOApp

#NFC
PRODUCT_PACKAGES += \
	libnfc \
	libnfc_ndef \
	libnfc_jni \
	Nfc \
	NFCDemo \
	Tag \
	TagTests \
	TagCanon \
	AndroidBeamDemo \
	NfcExtrasTests \
	com.android.nfc_extras