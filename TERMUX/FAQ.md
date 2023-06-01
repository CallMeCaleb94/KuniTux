It is strongly suggested to start from these pages because FAQ does not provide tips and tricks about Termux usage.

- [User Interface](https://wiki.termux.com/wiki/User_Interface "User Interface") - description of available buttons, menus, etc.
- [Package Management](https://wiki.termux.com/wiki/Package_Management "Package Management") - how to install, remove and upgrade packages.
- [Touch Keyboard](https://wiki.termux.com/wiki/Touch_Keyboard "Touch Keyboard") - Touch keyboard shortcuts and extra keys layout configuration.
- [PRoot](https://wiki.termux.com/wiki/PRoot "PRoot") - Running Linux distributions inside Termux (userspace chroot mode)
- [Recover a broken environment](https://wiki.termux.com/wiki/Recover_a_broken_environment "Recover a broken environment") - Fixing broken Termux installations.
- [Special:AllPages](https://wiki.termux.com/wiki/Special:AllPages "Special:AllPages") - List of the all available Wiki pages.

  
You may contribute to Termux project by making pull requests in our [Github repositories](https://github.com/termux) or by improving Termux Wiki.

## What is Termux

_Main Article: [Getting started](https://wiki.termux.com/wiki/Getting_started "Getting started")_

Termux is a [terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) for Android OS with its own package ecosystem. There are more than 1000 packages for various purposes, including code editors, compilers, etc.

## Is Termux an emulator

Termux is an emulator and is not. It does not emulate any system; Programs are executed natively. On the other hand, it is a terminal emulator in the same way as many common Linux distribution programs are; e.g., GNOME terminal, Konsole, Xterm and many more.

[Terminal](https://en.wikipedia.org/wiki/Computer_terminal) is a hardware device typically used before traditional desktop computers appeared.

[Terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) is a software that emulates a display (not CPU or whole system) with capabilities of specific hardware terminal.

## What are system requirements

Android OS of version 7.0 as minimum. Be prepared that Termux uses much of internal storage, you are dealing with packages ported from Linux distributions. That's 500 MB - 5 GB typically, in some cases more... Everything depends on your use cases.

Also it is preferable to have AOSP Android, to avoid vendor-specific quirks with process management and power-saving.

## Will Termux work on Android 11

In short: yes, it works on Android 11 and 12 beta.

Android security improvements in new versions often become a subject of controversial discussions and recent `execve()` system call restriction by SELinux configuration introduced with Android 10 was not the exception. There lots of misinformation and conspiracy (aka "Google want to kill Linux on Android") from people claiming themselves "advanced users" about what is actually happening.

Applications built with target SDK level 29 (means compatibility with Android 10) will no longer be able to execute data files. All executables must be packaged within the APK file. That's a reasonable restriction. Application must not be able to modify itself. Updates and new features must come within the APK of newer version. However there is a problem: Termux is technically a bridge between Android application and Linux environments.

Fortunately, we chose to force use compatibility with Android 9 APIs (SDK 28) at the cost of ability to publish updates on Google Play. That is until we will workaround the issue. For now do not worry - it works perfectly.

Termux also supports Android 12 but running the app on this version of Android would kill phantom processes and crash the app, meaning spawning several processes would randomly close the application unintentionally. if you plan to upgrade your device to Android 12, upgrade at your own risk!

Related issue: [https://github.com/termux/termux-app/issues/2366](https://github.com/termux/termux-app/issues/2366)

## Why does htop or netstat not work on my device

In order to stop leaking sensitive information via side channels, Android has blocked access to certain interfaces in /proc. This is done for your privacy.

Specifically:

- /proc/net/*
- /proc/loadavg
- /proc/stat
- /proc/uptime
- /proc/version
- /proc/vmstat
- And few others.

  
Restrictions vary between Android OS versions. Thus Android 7 is less restrictive than 8/9/10+. You can use root to bypass them.

Do not open issues in our repositories on this or complain how Google is evil. We do not support such opinion or other Android-specific conspiracy.

## Why does ps not show Android processes

Since Android 7, regular applications no longer can explore foreign processes in /proc. This has been [implemented](https://android.googlesource.com/platform/system/core/+/c39ba5a) via hidepid=2 mount option.

Termux can list only its own processes. You can see more only under rooted shell or ADB.

This restriction has weird effect on some programs. For example, some processes like `ssh-agent` or `tor` daemons will no longer be visible through `ps` and as result can't be terminated with `pkill <NAME>` or `killall <NAME>` but only with `kill <PID>`.

## Why my Termux is 32bit while CPU supports 64bit

If Android OS reports support only of 32-bit ABIs, Termux will perform a 32-bit installation only. Its environment is not standalone and relies on libraries provided by operating system. So if your system is 32-bit only, you are out of luck. That is common issue with some device models where manufacturer installed only 32-bit OS due to small system partition.

## Can Termux be installed on the external storage

This can't be done, at least if your device is not rooted.

Termux requires a native Linux file system such as [EXT4](https://en.wikipedia.org/wiki/Ext4) or [F2FS](https://en.wikipedia.org/wiki/F2FS) for supporting special files like [symbolic links](https://en.wikipedia.org/wiki/Symbolic_link), [sockets](https://en.wikipedia.org/wiki/Unix_domain_socket) and Unix file attributes. Neither [FAT32](https://en.wikipedia.org/wiki/File_Allocation_Table) or exFAT supports them. Furthermore, Android applies a special overlay to any general purpose file storage which turns underlying file system into FAT32 or exFAT-like in order to solve certain issues and provide a better experience for average user.

If your device is rooted and you want to install Termux on external storage, please refer to post on [Android Enthusiasts Stack Exchange](https://android.stackexchange.com/questions/228443/can-the-termux-environment-be-put-on-an-external-sd-card).

## Any tips for using Termux

Here are the ones which should help you to survive in Termux shell:

- Learn shell scripting!
- Always do `pkg upgrade`!
- Do backups, always!
- Do not execute things which you do not know!
- Carefully read everything that has been printed to terminal!

## What do you use Termux for

You can do everything, specifically what you are able to do with it. That is the case where you are limited mostly by your skills. Of course, OS and device hardware restriction matter too, but they are insignificant.

Here are just few ideas for Termux usage:

- Device automation with scripting and Termux Tasker add-on.
- File transfer & synchronization via syncthing, rsync, rclone, etc.
- [SSH](https://en.wikipedia.org/wiki/SSH_(Secure_Shell)) client (dropbear, openssh).
- Programming (clang, python, vim, etc).

## Are there any Termux tutorials

Please check page [Getting started](https://wiki.termux.com/wiki/Getting_started "Getting started").

Note that while you can learn shell scripting with Termux, it is not the best tool for this due to few [fundamental differences](https://wiki.termux.com/wiki/Differences_from_Linux "Differences from Linux") from the Linux distributions.

## What are advantages of root in Termux

Root gains you control over system components. You will be able to access freely all file systems, modify device firmware (ROM) as well as perform fine tuning of kernel configuration, networking, etc.

Certain tools like cryptsetup, mount, nmap (advanced scan modes), tcpdump require root access.

## What is a fake root

Fake root means exactly "fake root", i.e., not real root. It does not provide any real superuser privileges. It just changes user ID and label to assist in certain tasks.

There 2 ways to get a fake root:

- Package `fakeroot` - useful solely for packagers who need to create archives with files having certain ownership and permissions. Of course, using the real root in this case is overkill.
- Package `proot` - run a rootless Linux distribution "chroot".

  
Fake root will not help you to root your device. Neither will help you to run a software requiring superuser privileges.

## Can I hack a social media with Termux

_Main Article: [Hacking](https://wiki.termux.com/wiki/Hacking "Hacking")_

As some people say, there nothing impossible in the world, and that's true in case of Termux and specifically this question. However we do not provide any help on it - you are on your own.

Hacking and phishing topics are discouraged within all official Termux communities.

## Where are Metasploit and Hydra packages

_Main Article: [Hacking](https://wiki.termux.com/wiki/Hacking "Hacking")_

Packages Hashcat, Hydra, Metasploit and Sqlmap have been removed from Termux repositories. We do not accept requests of hacking packages and neither provide help for using or installing them.

## Why app from F-Droid cannot be installed

Open your Android settings --> Applications and check whether you have applications containing the word "Termux" in their name. If so, uninstall all of them: Termux, Termux:API, Termux:Styling, Termux:Widget, Termux:Boot and others. And yes, paid add-dons should be uninstalled too.

After that you should be able to install Termux app from F-Droid.

## Why Termux add-ons on Google Play are paid even though their sources are on GitHub

This has been made as kind of donation. If you do not want to donate, use application and add-ons from F-Droid or custom builds from sources.

Remember that open-source or free software does not mean that software cannot be paid. This is not forbidden by licenses of our source code. Also "free" means "freedom", in context of GNU GPL which even explicitly states that free software can be paid as soon as sources are freely available.

## How can I keep my data when reinstalling Termux

_Main Article: [Backing up Termux](https://wiki.termux.com/wiki/Backing_up_Termux "Backing up Termux")_

You need to archive contents of these directories:

/data/data/com.termux/files/usr
/data/data/com.termux/files/home

You can use utility `tar`. Before uninstalling the app, ensure that archives are placed to safe location such as `/sdcard`.

## Repositories are down and return 403 404 errors

Switch to a working repository with `termux-change-repo`. You will need to select repositories which do not work, if unsure what to select - select everything.

[https://github.com/termux/termux-packages/issues/6726](https://github.com/termux/termux-packages/issues/6726)

## How to open failsafe shell

There are 2 variants how to do that: 1. Open drawer by swiping rightwards -> long tap on "new session" -> tap "failsafe". 2. Close Termux app -> long tap on icon -> tap "failsafe".

See [Recover a broken environment](https://wiki.termux.com/wiki/Recover_a_broken_environment "Recover a broken environment") for more information on Termux recovery topic.

## How can I access device storage with Termux

_Main Article: [Internal and external storage](https://wiki.termux.com/wiki/Internal_and_external_storage "Internal and external storage")_

You need to grant a _Storage access permission_ to application. We recommend to do that through command

termux-setup-storage

It will ask for permission and once it was granted, it will setup a symlinks in directory ~/storage to standard directories like DCIM, Download, etc.

Storage (shared) is usually accessible through:

- /storage/emulated/0
- /storage/self/primary
- $HOME/storage/shared

  
External storage is restricted by Android OS. You can read files but cannot write them, except ones located in Termux private directory accessible through `$HOME/storage/external-1`. Termux cannot have write access to external storage like file manager applications do.

If you are on Android 11 and storage suddenly has become inaccessible, then revoke permission from Android settings and grant again.

## How can I hide the extra keys

Tap key combination _Volume Up + K_.

Alternate approach is to open drawer via swiping rightwards from the left screen side and then long tap on "Keyboard" button.

## Why text appears only after hitting space

This is a keyboard-specific known issue. It happens because keyboard has not internally reset input method type and tries to use unsupported features like auto-correction or prediction.

In order to solve issue you need to use either a different keyboard or run these commands:

mkdir -p ~/.termux
echo "enforce-char-based-input = true" >> ~/.termux/termux.properties

Restart application after making changes to "termux.properties" file.

## How do I get help for a specific package

Usually you can use next commands to get a brief usage of the utility:

packagename -h
packagename --help

More advanced information can be viewed by using a `man` tool. It can be [installed](https://wiki.termux.com/wiki/Package_Management "Package Management") by

pkg install man

Here is an example how to view information for utility `ls`:

man ls

Tips, when reading a man page:

- Use q to quit
- Use space for next page
- /search for search
- n for repeat search

  
Sometimes utility name may not match the package name. If you encountered a such package, consult its online home page to get a brief introduction or use utility `apt-file` to list the available files including utilities and documentation.

## Why does a compiled program show warnings

Warnings produced by dynamic linker about unused sections are safe. They just notify developer that ELF header of executable file has extra information which cannot be interpreted by current linker version. In case of DT_FLAGS_1=0x8, it warns about RTLD_NODELETE ELF section. Besides DT_FLAGS_1=0x8, there more types of ELF sections which are not handled by Android linker.

To make this warning disappear you need to use utility "termux-elf-cleaner" binary file and probably on all its dependencies.

pkg install termux-elf-cleaner
termux-elf-cleaner ./myprogram
termux-elf-cleaner ./libmysharedlibrary.so

Number of supported ELF sections increases with each Android OS version. On Android >7.0 you may not get such warnings.

## Can I use Termux packages in my own project

Yes, as Termux is open-source and uses a GNU GPL v3.0 and in some components Apache-2.0 license, you can freely re-use existing components as soon as you met the license requirements.

However license does not cover "free" use of our hosting capabilities which are somewhat limited. You cannot use our package repositories in your own project(s). Please build packages and host them yourself.

Get started with information on developer's wiki pages: [https://github.com/termux/termux-packages/wiki](https://github.com/termux/termux-packages/wiki).

## How to run Termux commands from other application

Termux provides optional interface for processing command execution requests made by third-party applications.

Detailed information with examples is available at [https://github.com/termux/termux-app/wiki/RUN_COMMAND-Intent](https://github.com/termux/termux-app/wiki/RUN_COMMAND-Intent).

## Can Termux run some commands automatically right after installation

No, this feature has not been implemented. Unconditional automated execution of arbitrary commands (script on shared storage) also implies a security issue.

Worth to note that Termux does not have storage access by default and we have not re-considered this behavior.

Related pull request: [https://github.com/termux/termux-app/pull/1455](https://github.com/termux/termux-app/pull/1455)

# See Also

- [Community](https://wiki.termux.com/wiki/Community "Community")
- [Development](https://wiki.termux.com/wiki/Development "Development")

 [Edit](https://wiki.termux.com/index.php?title=FAQ&action=edit "Edit this page [alt-shift-e]")[‌](https://wiki.termux.com/wiki/FAQ#)

## CONTENTSto top

- [What is Termux](https://wiki.termux.com/wiki/FAQ#What_is_Termux)
- [Is Termux an emulator](https://wiki.termux.com/wiki/FAQ#Is_Termux_an_emulator)
- [What are system requirements](https://wiki.termux.com/wiki/FAQ#What_are_system_requirements)
- [Will Termux work on Android 11](https://wiki.termux.com/wiki/FAQ#Will_Termux_work_on_Android_11)
- [Why does htop or netstat not work on my device](https://wiki.termux.com/wiki/FAQ#Why_does_htop_or_netstat_not_work_on_my_device)
- [Why does ps not show Android processes](https://wiki.termux.com/wiki/FAQ#Why_does_ps_not_show_Android_processes)
- [Why my Termux is 32bit while CPU supports 64bit](https://wiki.termux.com/wiki/FAQ#Why_my_Termux_is_32bit_while_CPU_supports_64bit)
- [Can Termux be installed on the external storage](https://wiki.termux.com/wiki/FAQ#Can_Termux_be_installed_on_the_external_storage)
- [Any tips for using Termux](https://wiki.termux.com/wiki/FAQ#Any_tips_for_using_Termux)
- [What do you use Termux for](https://wiki.termux.com/wiki/FAQ#What_do_you_use_Termux_for)
- [Are there any Termux tutorials](https://wiki.termux.com/wiki/FAQ#Are_there_any_Termux_tutorials)
- [What are advantages of root in Termux](https://wiki.termux.com/wiki/FAQ#What_are_advantages_of_root_in_Termux)
- [What is a fake root](https://wiki.termux.com/wiki/FAQ#What_is_a_fake_root)
- [Can I hack a social media with Termux](https://wiki.termux.com/wiki/FAQ#Can_I_hack_a_social_media_with_Termux)
- [Where are Metasploit and Hydra packages](https://wiki.termux.com/wiki/FAQ#Where_are_Metasploit_and_Hydra_packages)
- [Why app from F-Droid cannot be installed](https://wiki.termux.com/wiki/FAQ#Why_app_from_F-Droid_cannot_be_installed)
- [Why Termux add-ons on Google Play are paid even though their sources are on GitHub](https://wiki.termux.com/wiki/FAQ#Why_Termux_add-ons_on_Google_Play_are_paid_even_though_their_sources_are_on_GitHub)
- [How can I keep my data when reinstalling Termux](https://wiki.termux.com/wiki/FAQ#How_can_I_keep_my_data_when_reinstalling_Termux)
- [Repositories are down and return 403 404 errors](https://wiki.termux.com/wiki/FAQ#Repositories_are_down_and_return_403_404_errors)
- [How to open failsafe shell](https://wiki.termux.com/wiki/FAQ#How_to_open_failsafe_shell)
- [How can I access device storage with Termux](https://wiki.termux.com/wiki/FAQ#How_can_I_access_device_storage_with_Termux)
- [How can I hide the extra keys](https://wiki.termux.com/wiki/FAQ#How_can_I_hide_the_extra_keys)
- [Why text appears only after hitting space](https://wiki.termux.com/wiki/FAQ#Why_text_appears_only_after_hitting_space)
- [How do I get help for a specific package](https://wiki.termux.com/wiki/FAQ#How_do_I_get_help_for_a_specific_package)
- [Why does a compiled program show warnings](https://wiki.termux.com/wiki/FAQ#Why_does_a_compiled_program_show_warnings)
- [Can I use Termux packages in my own project](https://wiki.termux.com/wiki/FAQ#Can_I_use_Termux_packages_in_my_own_project)
- [How to run Termux commands from other application](https://wiki.termux.com/wiki/FAQ#How_to_run_Termux_commands_from_other_application)
- [Can Termux run some commands automatically right after installation](https://wiki.termux.com/wiki/FAQ#Can_Termux_run_some_commands_automatically_right_after_installation)
-
#TERMUX 