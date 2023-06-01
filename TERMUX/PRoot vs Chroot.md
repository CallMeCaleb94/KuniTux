The main different of chroot from PRoot os that it is native. Unlike PRoot, it does not use ``ptrace()`` for hijacking system call arguments and retrun values to fake the visible file system layout or user/group IDs. It does ot cause for overead and works without issue on any device. However it requires superuser permissions. 

IF you have rooted device and want to have a better experience  with using the Linux distributions in termux, then use ``chroot``. In tis case get started with [Linux Deploy] (https://play.google.com/store/apps/details?id=ru.meefik.linuxdeploy&pli=1) app for automated instaallation. Things like shell can be used from Termux of course.

## General usage information

The main purpose of PRoot is to run the Linux distribution inside Termux without having to root device.

Simplest way to start a shell in a distribution chroot is:
``` 
uset LD_PRELOAD
proot -r ./rootfs -0 -w -b /dev -b /proc -b /sys /bin/sh
```

Where:
-   `unset LD_PRELOAD` - Termux-exec, execve() hook, conflicts with PRoot.
-   `-r ./rootfs` - option to specify the rootfs where Linux distribution was installed.
-   `-0` - tells PRoot to simulate a root user which expected to be always available in Linux distributions. This option will allow you to use package manager.
-   `-b /dev -b /proc -b /sys` - make file systems at /dev, /proc, /sys appear in the rootfs. These 3 bindings are important and used by variety of utilities.
-   `/bin/sh` - a program that should be executed inside the rootfs. Typically a shell.

You can learn more about options supported by PRoot by executing `proot --help`.
#TERMUX 