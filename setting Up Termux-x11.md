1. How it works
The executable `termux-x11` (found in the x11 repo), creates a socket through $XDG_RUNTIME_DIR in the Termux directory by default.

The Wayland sockets are the way for the graphical apps to commune with Termux X11 applications do not have Wayland support yet.

2. Requirements
	- Termux from f-droid or termux-dev builds
	- termux-x11 app from Github releases page

3. Setup
Install both `x11-repo` and then install `termux-x11-nightly`.

`pkg in x11-repo termux-x11-nightly -y`

Start the `termux-x11` app (the apk you installed)
and use execute the following to start the x11 server

`termux-x11 :0 &`

**`:0` as display number prevents termux-x11 from locking the terminal**

5. From here execute the following `i3` will be used as an example.
```bash
termux-x11 -xstartup i3
```

You are able to specify applications such TigerVNC Viewer, Firefox, etc.

**Noter Termux-X11 is considered unstable so take that into consideration when asking for assitance `termux-info` is your friend**

#TERMUX 