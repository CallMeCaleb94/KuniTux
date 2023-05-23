This is why Termux does not use official Debian or Ubuntu packages for its environment.

Termux doesn’t follow Filesystem Hierarchy standard unlike majority of distros

IF you need a classical Linux file system layout for some reasons you may try to use ``termux-chroot`` from the package ``proot`` 

```
> pkg install proot
> termux-chroot
> ls 
bin doc etc include lib libexec share tmp var
```

## Termux uses Bionic libc

To have the best compatibility with Android OS and to remove the need to maintain custom toolchains we compile all our packages with the Android NDK. The resulting binaries are linked against the Bionic libc (files libc.so, libm.so, libdl.so from /system/lib or /system/lib64)
#TERMUX 