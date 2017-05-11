# Inherit omni-specific board config
include device/huawei/angler/BoardConfigPurity.mk

# Inherit base AOSP device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# include vendor blobs
$(call inherit-product-if-exists, vendor/huawei/angler/angler-vendor.mk)

# Inherit APNs list
$(call inherit-product, vendor/purity/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/purity/config/common.mk)

# TWRP
PRODUCT_COPY_FILES += \
    device/huawei/angler/twrp.fstab:recovery/root/etc/twrp.fstab

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.HAL3.enabled=1 \
    persist.camera.cpp.duplication=false

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# drmservice prop
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Omni Stuff 
PRODUCT_PACKAGES += \
    NexusParts

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=noop

# Facelock properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.facelock.black_timeout=700 \
    ro.facelock.det_timeout=2500 \
    ro.facelock.rec_timeout=3500 \
    ro.facelock.est_max_time=600

# Override product naming for Omni
PRODUCT_NAME := purity_angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="google/angler/angler:7.1.2/N2G47O/3852959:user/release-keys" \
    PRIVATE_BUILD_DESC="angler-user 7.1.2 N2G47O 3852959 release-keys" \
    BUILD_ID=N2G47O
