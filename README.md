# Xiaomi HyperOS / MIUI app removal helper

This Bash script uses Android Debug Bridge (ADB) to uninstall a small,
hard-coded list of apps for the currently active Android user. It does not
require root and does not remove the packages from the system image.

## Requirements

- Bash
- Android Platform Tools (`adb`)
- USB debugging enabled and this computer authorized on the phone
- Exactly one authorized ADB device connected

## Run

Connect and authorize the phone, then run:

```bash
bash "Xiaomi HyperOS mini debloade"
```

The script displays the selected device, Android user, and package list and
requires explicit confirmation before making changes. Packages are matched by
their exact package IDs. Apps that are not installed are skipped.

## Important

The package list is a starting point, not a guarantee that every listed app is
unnecessary on every Xiaomi device or OS version. Removing an app can disable
features that depend on it. Review the list and understand the effects before
confirming. The operation applies only to the current Android user; it does not
erase the app from the device's system image.

To restore an app for a user, where the OS still has the system package:

```bash
adb -s DEVICE_SERIAL shell cmd package install-existing --user USER_ID PACKAGE_ID
```

Replace `DEVICE_SERIAL` with the serial shown by the script, `USER_ID` with the
displayed Android user ID, and `PACKAGE_ID` with the package name, for example
`com.miui.analytics`.
