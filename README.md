# Display daemon for Ubuntu

This script has been created to resolve a bug which can occured on Ubuntu (or other Linux distributions).

## Bug fixed:

Loss of display settings after reboot when you user an extra screen.

## How to use it?

```bash
$ sudo make
```

This will copy the script to your $HOME folder, copy a service file to your /etc/systemd/system folder and enable and start this service.

## Why do I have to use sudo?

Interacting with service files requires privileged access.
