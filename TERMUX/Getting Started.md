Termux is a terminal emulator application enhanced with a large set of command line utilities ported to Android OS. The main goal is to bring the Linux command line experience to users of mobile devices with no rooting or other special setup required. 

## How Does it Work
The terminal emulator is basically an application that launches the command line program by using system call [execve](https://www.man7.org/linux/man-pages/man2/execve.2.html)
Most terminall applications available on Android OS work with a very limited set of utilities which are usually provided either by the operating system or other rooting tools such as Magisk. We have decided to further and port common software usually available on GNU/Linux systems to Android OS.
Termux is neither a virtual mach supported by default.
ine nor any other kind of emulated or simulated environment. All provided packages are cross-compiled with Android NDK and only have compatibility patches to get them working on Android. The operating system does not provide full access to file systems so Termiux cannot install package files into standard directores such as /bin, /etc, /usr, or /var. Instead all files are installed into the private application directory located at
```
/data/data/com.termux/files/usr
```
We call that directory “prefix” and usually refer to it as “$PREFIX”, which is also an exported enviroment bariable in the Termux shell. Note that this directorry cannot be changed or moved to an SD-Card because:
	- The File System must have supprot for unix permissions and special files such as symlinks or  sockets.
	- The prefix path is hardcoded into al binarries. 
In addition to prefix, users can store files in the home directory (or $HOME) available at 
```]
/data/data/com.termux/files/home
```
However, the file system is not the only difference from tradition Linux distributions. For more information Read [Differences from Linux](https://wiki.termux.com/wiki/Differences_from_Linux)

### What Can I do with Termux?
There are a number of common use-cases for the Termux application:
- Data processing with Python.
- Programming in a development environment.
- Downloading and managing files and pages using time-established tools.
- Learning the basics of Linux command line enviroment.
- Running an SSH client.
- Synchronizing and backing up yourfiles.
Ofcourse, usage is not limited to the topics listed above. There are more than 1,000 packages in our repositories. If these packages don’t have what you’re looking for you can compile your own - we have a variety of build tools including compilers for languages lie C, C++, Go, Rust. Interperters for common languages for NodeJS, Python, Ruby are available too.

Please note, Termux is not a rooting tool and will not give you root privileges unless you are skilled enough to break the Android OS security.

#### Is root required?
Normally Termux does not require to be rooted. In fact it’s primarily targeted for non-root users.

**You May want to root your device to**
- Modify a device’s firmware.
- manipulate the parameters for the operating system or kernel
- Non-interactivley install/uninstall APKs.
- HAve full R/W access to hardware devices such as BT/Wi-fi modules
#TERMUX 

#TERMUX 