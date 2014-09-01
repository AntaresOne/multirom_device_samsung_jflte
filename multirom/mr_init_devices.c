#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
 "/sys/class/graphics/fb0",

 "/sys/block/mmcblk0",
 "/sys/devices/platform/msm_sdcc.1",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p20",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p29",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p16",

 "/sys/bus/mmc",
 "/sys/bus/mmc/drivers/mmcblk",
 "/sys/bus/sdio/drivers/bcmsdh_sdmmc",
 "/sys/module/mmc_core",
 "/sys/module/mmcblk",

 "/sys/devices/virtual/input*",
 "/sys/class/misc/uinput",
 "/sys/devices/i2c-3/3-0020/input/input3", //touchscreen stuff
 "/sys/devices/i2c-3/3-0020/input/input3/event3", //touchscreen
 "/sys/devices/platform/msm_ssbi.0/pm8921-core/pm8xxx-pwrkey/input*",
 
 // for adb
 "/sys/class/tty/ptmx",
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p16", //system
 "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p18", // /cache
 "/sys/class/misc/android_adb",
 "/sys/class/android_usb/android0/f_adb",
 "/sys/bus/usb",

 // USB Drive is in here
 "/sys/devices/platform/msm_hsusb_host*",

 NULL
};