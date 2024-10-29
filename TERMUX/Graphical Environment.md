(Only applicable to Android 7.0+)

Termux provides support for programs that use the (X Window System). However, thernow hardware acceleration for rendering and user will have to install a thridy party application to view graphical output. 

To use X11-enabled programs, please, make sure that atleast one of the following programs is installed.

- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) The best choice for interacting with graphical environment. Requires a running VNC server.
- [XServer XSDL](https://play.google.com/store/apps/details?id=x.org.server) this one may be unstble but it provides a standalone Xorg server so you don’t have to set up VNC.
- [Android XServer](https://github.com/nwrkbiz/android-xserver)Only implements the core X11 protocol. Shares clipboard between android/X11 and includes a Window Manager
- [termux-x11](https://github.com/nwrkbiz/android-xserver) Termux X11 add-on applicationon

# Enabling the x11 Repository

X11 packages are available in a separate APT repository. You can enable it by running the following command: 
```
pkg install x11-repo
```
It will automatically add appropriate sources.list file and PGP key. 
To disable this repository you have to uninstall 
```
x11-repo
```


## Setting up VNC

*Server*
IF you decide to use VNC for graphical output, follow these instructions for properly setting up VNC server. 

1. Install package `tigervnc`
```
pkg install tigervnc
```
2. After installation, execute this:
```
vncserver -localhost
```

   After first time, you will be prompted for setting up passwords.
```
You will require a password to access your desktops
Password:
Verify:
Would you like to enter a view-0nly password (y/n)? n
```

*Note that passwords are not visible when you are typing them and maximal password length is 8 characters, minimum is 6*

3. If everything is okay you will see this message:
```
New 'localhost:1 ()' desktop is localhost:
Creating default startup script /data/data/com.termux/files/home/.vnc/xstartup
Creating default config /data/data/com.termux/files/home/.vnc/config
Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log
It means that X (vnc) server is available for display ‘localhost:1’
```

1. Finally, to make programs do graphical output to the display `locahost.log` , set environment variable like shown here (yes, without soecifying `localhost`):
```
export DISPLAY=":1"
```
You may even put this variable to your bashrc or profile so you don’t always have to always set it maually unless display address will be changed.

### Client
Here will be assumed that you use this Android VNC client [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)  (developed by RealVNC Limited).

1. Determine port number on which VNC server listens. It can can be calculated like this  ``5900 + {display number}``. So for display ‘localhost:1’ the port will be 5901.
2. Now open the VNC Viewer application and create a new connection with the follwing information (assuming that VNC port 5901):
```Address: 
127.0.0.1:5901 

Name:
Termux
```
- If you are using VNC client on a computer using the same network as the phone does, make sure you correctly start a VNC session and know the IP address of the device.
1. Now launch it. You will be prompted for password that you entered on first launch of `vncserver`. Depending on packages you installed, you may see either entirely blackscreen or terminal prompt ( only if ‘aterm ’ is installed).

#### Setting up XServer 
Xserver setup is nearly same for VNC. The only differences are that you don’t have to configure authentication and variable “DISPLAY” should be set like 
```
export DISPLAY=localhost:0
```
*Note that you don’t need to set variable “PULSE_SERVER” like application suggests because Termux uses itsown Pulseaudio package*

##### Window Managers
When using Android Xserver rather than Android XSDL these are optional.

**Fluxbox**

Simpleset way to get a working graphical enviroment is to install Fluxbox:
```
pkg install fluxbox
```
It can be started automatically on VNC server startup. Todo this, edit file `~/.vnc/xstartup` as shown here:
```bash
#!/data/data/com.termux/files/usr/bin/sh
## Fluxbox desktop.

# Generate menu.
fluxbox-generate_menu

# Start fluxbox.
fluxbox &
```

**Openbox**
Openbox requires more complicated configuration than Fluxbox. Firstly you need to install some packages:
```
pkg install openbox pypanel xorg-xsetroot
```
Put the following lines to your `~/.vnc/xstartup`
```bash 
#!/data/data/com.termux/files/usr/bin/sh

# Start Openbox.
openbox-session &
```
Don’t put anything else to file `~/.vnc/xstartup` but only lines shown above since Openbox has own autostart script. It is located at `${PREFIX}/etc/xdg/openbox/autostart` (or alternatively at `~/.config/openbox/autostart`). Edit this file like here:
```
# Make background gray.
xsetroot -solid gray

# Launch PyPanel.
pypanel &
```

###### Desktop environment
Reccomened way of installation is through metapackage and not the seperate components:
```
pkg install xfce4
```
VNC server startup configuration (`~/.vnc/xstartup`) should contain only
```bash
#!/data/data/com.termux/files/usr/bin/sh
xfce4-session &
```
Additional recommended packages for installation:
- `netsuft` - Simple graphical web browser. Javascript not supported.
- `xfce4-terminal`-Terminal emulator for XFCE. It is not included in the META to allow `aterm` or `st`

**LXQt**
Recommended way of installation is through metapackage and not the seperate components: 
```
pkg install lxqt
```
VNC server startup configuration (`~/.vnc/xstartup`) should contain only
```bash
#!/data/data/com.termux/files/usr/bin/sh
startlxqt &
```
Additional recommended packages for installation:
- `otter-browser`-Free and opensource web browser that aims to recreate aspects of Opera 12.x
- `qterminal`-Terminal emulator for LXQt. It is not included in META for `aterm` & `st`.

**MATE**
As of right now, there is no MATE metapackages. So you need to install all required MATE components separately
```
pkg install mate-* marco
```
VNC start up configuration (`~/.vnc/xstartup`) should contain only
```bash
#!/data/data/com.termux/files/usr/bin/sh
mate-session &
```
Additional reccoemended packages for installation:
- `netsurf`- Simple graphical web browser. Jacascript is not supported.
- `mate-terminal`- Terminal emulator for MATE.

**NOTES**
-Currently hardware acceleration is not

#TERMUX 