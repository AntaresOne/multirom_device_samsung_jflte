# Copyright (C) 2009 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8960
-include device/samsung/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/jflte/include

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/jf
BOARD_KERNEL_CMDLINE         := androidboot.hardware=qcom user_debug=31 zcache msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 androidboot.selinux=permissive
BOARD_KERNEL_BASE            := 0x80200000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE        := 2048
TARGET_KERNEL_VARIANT_CONFIG := custom_jf_defconfig
TARGET_KERNEL_SELINUX_CONFIG := jfselinux_defconfig

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# WiFi module
BOARD_HAVE_SAMSUNG_WIFI := true
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Adreno configuration
BOARD_EGL_CFG := device/samsung/jflte/configs/egl.cfg

# TWRP
TARGET_RECOVERY_FSTAB := device/samsung/jflte/multirom/twrp.fstab
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_SAMSUNG := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p29"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,discard,journal_async_commit,errors=panic wait,check,encryptable=footer"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.526593/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
#TWRP_EVENT_LOGGING := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_jflte
TARGET_LIBINIT_DEFINES_FILE := device/samsung/jflte/init/init_jflte.c

# bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/jflte/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/jflte/bluetooth/vnd_jf.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Needed for blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# NFC
BOARD_NFC_HAL_SUFFIX := msm8960

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Use seperate speakerphone device
BOARD_USES_SEPERATED_VOICE_SPEAKER := true

# Use USB Dock Audio
BOARD_HAVE_DOCK_USBAUDIO := true

# Use the ES325 dual mic feature
BOARD_HAVE_AUDIENCE_ES325_2MIC := true

# Samsung's nonstandard csd-client
BOARD_HAVE_SAMSUNG_CSDCLIENT := true

# Use seperate devices for VOIP
BOARD_USES_SEPERATED_VOIP := true

# Use seperate devices for 3-pole headset
BOARD_USES_SEPERATED_HEADSET_MIC := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Camera
TARGET_NEED_CAMERA_ZSL := true
TARGET_NEED_SAMSUNG_MAGIC_ZSL_1508 := true
TARGET_ADD_ISO_MODE_1600 := true
TARGET_ADD_ISO_MODE_HJR := true
TARGET_DISABLE_ZSL_FOR_FFC := true

# Assert
TARGET_OTA_ASSERT_DEVICE := jflte,jfltexx,i9505,GT-I9505,jgedlte,i9505g,GT-I9505G,jfltevzw,jfltespr,jflterefreshspr,jfltetmo,jfltecri,jfltecsp,jflteatt,jfltecan,jflteusc,jfltezm

# Kernel
TARGET_KERNEL_CONFIG         := jf_eur_defconfig

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/jflte/releasetools

# Smart Cover
BOARD_HAS_EXTENDED_SWITCH := true

# Use my hacky workaround temporarily
# until the real fix is implemented
SEPARATED_VOIP_SHORTCUT := true

# MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/jflte/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_FSTAB := device/samsung/jflte/multirom/twrp.fstab
MR_KEXEC_MEM_MIN := 0x85000000
MR_USE_MROM_FSTAB := true
MR_DEVICE_HOOKS := device/samsung/jflte/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 1
