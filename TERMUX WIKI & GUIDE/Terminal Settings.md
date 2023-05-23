The termux terminal can be configured by editing the 
```~/.termux/termux.properties``` file. This file uses simple
```key=value``` property syntax.

Lines beginning with 
```#``` are comments and do not get executed. Most of the properties are included as comments in the file. Uncomment an existing line or add a new line to configure a property.

For changes to take effect after editing the proeprties file, either execute 
```termux-reload-settings``` or restart Termux by closing all sessions and starting the application again.

*Dark Theme

Force the application to use dark theme for drawer and dialogs with 

``` use-black-ui=true 
``` 

*FullScreen Mode

Enable fullscreen mode with 
```
fullscreen=true
``` 

It is likely that with fullscreen enabled the Extra KEys view may no longer be visible. To fix, add 
``` 
user-full-screen-workaround=true
```

<font color="#ff0000">*Note*</font> : *Fullscreen may not work well for all devices to cosider it ubstable for now*

*Handling terminal sesssions*

Use shortcut key combonations to handle common session actions. Add shortcuts to ope a new session, switch between sessions and rename sessions with. 

```
# Open a new terminal with ctrl + t (volume down + t)
shortcut.create-session=ctrl + t

# Go one session down with (for example) ctrl + 2
shortcut.next-session=ctrl + 2

# Go one session up with (for example) ctrl + 1
shortcut.previous-session=ctrl + 1

# Rename a session with (for example) ctrl + n
shortcut.rename-session=ctrl + n
```

*Handling the bell character*
Adjust the behavior of how the bell character is received with the ``bell-character property``
```
# Vibrate device (default).
bell-character=vibrate

# Beep with a sound.
bell-character=beep

# Ignore bell character.
bell-character=ignore
```

*Handling the back key*

Adjust the behavoir of how the back key is andled with the 
```back-key property``` 
```# Send the Escape key.
back-key=escape

# Hide keyboard or leave app (default).
back-key=back
```

Source: https://wiki.termux.com/wiki/Terminal_Settings 
#TERMUX 