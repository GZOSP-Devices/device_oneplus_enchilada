# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common GZOSP stuff.
$(call inherit-product, vendor/gzosp/config/common_full_phone.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

DEVICE_PACKAGE_OVERLAYS += device/oneplus/enchilada/overlay

# Inherit from enchilada device
$(call inherit-product, device/oneplus/enchilada/device.mk)

ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Discard inherited values and use our own instead.
PRODUCT_NAME := gzosp_enchilada
PRODUCT_DEVICE := enchilada
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := ONEPLUS A6003

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus6 PRODUCT_NAME=OnePlus6

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OnePlus/OnePlus6/OnePlus6:9/PKQ1.180716.001/1809071800:user/release-keys \
    PRIVATE_BUILD_DESC="OnePlus6-user 9 PKQ1.180716.001 1809071800 release-keys"

TARGET_VENDOR := oneplus

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model
