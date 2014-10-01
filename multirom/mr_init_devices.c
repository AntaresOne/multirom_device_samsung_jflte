#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
	"/sys/class/graphics/fb0", // Framebuffer

	// ADB stuff
	"/sys/bus/usb",
	"/sys/class/android_usb/android0/f_adb",
	"/sys/class/misc/android_adb",
	"/sys/class/tty/ptmx",
	
	// EMMC stuff
	"/sys/block/mmcblk0",
	"/sys/bus/mmc",
	"/sys/bus/mmc/drivers/mmcblk",
	"/sys/bus/sdio/drivers/bcmsdh_sdmmc",
	"/sys/devices/platform/msm_sdcc.1*",
	"/sys/module/mmcblk",
	"/sys/module/mmc_core",
	
	// MicroSD card
	"/sys/block/mmcblk1",
	"/sys/devices/platform/msm_sdcc.2*",

	// Input stuff
        "/sys/class/misc/uinput",
	"/sys/devices/i2c-3/3-0020/input/input3*", // Touchscreen
	"/sys/devices/platform/gpio-keys/input*", // Volume keys
	"/sys/devices/platform/msm_ssbi.0/pm8921-core/pm8xxx-pwrkey/input*", // Power key

	// USB-OTG
	"/sys/devices/platform/msm_hsusb_host*",

 NULL
};