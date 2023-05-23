IPv4 address space is limited and therefore to connect many devices to the internet a special and special mechanisms being used. Internet service providers usually share same IP address between several people. WiFi routers also share single external IP address between multiple connected devices. This is implemented through NAT.Depending on your network setup it can be local or carrier-grade.

Your device is not accessible from the Internet by default, if behind NAT. IF you are under carrier-grade NAT or can’t modify router settings (port forwarding) read below for the solutions how to make your device accessible from the Internet.

You do not need this if you have subscribed to mobile characters static IP service or were able to setup port forwarding in your WiFi router settings.


# TOR

Accessing device via Tor is the most secure and effective method - offers strong end-to-end encryption (onion services don’t use ‘exit’ node), virtual ports (e.g. 80 port without root), your service won’t be visible on plain internet.

However, this method require setting up a [Tor Onion Server](https://www.torproject.org/docs/onion-services.html.en).


*Installing needed packages*

The main package is `tor`. Install it by running this command:
```
pkg install tor
```
You want to install a `proxychains-ng` for accessing the Tor Network:
```
pkg install proxycahins-nig
```
Packages `torsocks` may not work since Android 8.


*Setting up Onion Service*


You will have to modify the default configuration file of tor (`$PREFIX/etc/tor/torrc`).
Here is an example of configuring SSH Onion Service, overwrite the torrc file with this content:
```
## Enable TOR SOCKS proxy
SOCKSPort 127.0.0.1:9050

## Hidden Service: SSH
HiddenServiceDir /data/data/com.termux/files/home/.tor/hidden_ssh
HiddenServicePor 22 127.0.0.1:8022
```

Then you need to make a directory where information abou Hidden Service will be stored:
```
mkdir -p ~/.tor/hidden_ssh
```

Now you can execute in console `tor`. If start was succesful, you can get your onion server hostname:

```
cat ~/.tor/hidden_ssh/hostname
```
Output should be like this: `g3yv3tvqrbow7koz.onion`

*Accessing your service*

First of all make sure that on client device `tor`
is running and you have all necessary software for acessing Tor Network (in this case package `proxychains-ng`)

To access te onion service created in previous steps run this :
```
proxychains4 ssh g3yv3tvqrbow7koz.onion
```

If everything is ok, the output should be like this:
```
The authenticity of host 'g3yv3tvqrbow7koz.onion (127.42.42.0)' can't be established.
ED25519 key fingerprint is SHA256:WGualHEq7SJdvVeXgy8a+btPQCd7uxTeXjlWdHHLwLc.
Are you sure you want to continue connecting (yes/no)?
```
Remember, `tor` should be running on both (client/server) sides, otherwise you will get connection errors. You can configure other servers (e.g. Ngnix) in the same way as shown in above example for SSH.
#TERMUX 