/*
 * This file contains device specific hooks.
 * Always enclose hooks to #if MR_DEVICE_HOOKS >= ver
 * with corresponding hook version!
 */

#include <stdio.h>
#include <unistd.h>

#if MR_DEVICE_HOOKS >= 1

int mrom_hook_after_android_mounts(const char *busybox_path, const char
*base_path, int type)
{
 // On M7, this fstab file is used to remount system to RO,
 // but with MultiROM, it remounts everything as RO, even /data and /cache
 if(access("/remount.qcom", F_OK) >= 0)
 return remove("/remount.qcom");
 return 0;
}
#endif /* MR_DEVICE_HOOKS >= 1 */
