
Step 1:
- On android device go to about page and tap build number 7 times to activate dev options.
- Then enable android debugging from dev settings.
- Now connect device to computer.

Step 2:
*Note you need Adb & Fastboot Commands installed on your PC*
[Download Platform Tools](https://developer.android.com/studio/releases/platform-tools)

- Open a terminal
- Type `ADB devices` you will see the device identifier, meaning you can interact with Android devices using the ADB shell.
- Now go ahead an execute the following

```
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent”
```
```
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647”
```

```
adb shell settings put global settings_enable_monitor_phantom_procs false 
```

These commands will disable the phantom process killer. To verify you need to run these two commands one by one.

```
adb shell "/system/bin/dumpsys activity settings | grep max_phantom_processes”
```

```
adb shell "/system/bin/device_config get activity_manager max_phantom_processes”
```

Make sure after running these two commands the **_return value should look the same as mine_**.

![[Disbale-Phantom-Process-Killer-3-600x94.webp]]
That means the phantom process killer is successfully disabled.
#Android #TERMUX 