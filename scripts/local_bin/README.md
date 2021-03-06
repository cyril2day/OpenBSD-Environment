### Local shell scripts for easy execution of repetitious commands.

Save to `$HOME/.local/bin` and add location to `$PATH`.
Almost all of the scripts were bound to i3wm config in `$HOME/.config/i3/config`.

- [cleartrash](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/cleartrash)
  \- invoke an empty-trash request and let the user confirm via dialog. Uses `zenity` for the dialog
  and `xfce4-notifyd` for the notification.

- [cmusremote](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/cmusremote)
  \- control `cmus` remotely using default socket in \$XDG_RUNTIME_DIR. Particularly useful for binding with multimedia
  keys and remote ssh connection. Accepts up to 3 args with the 3rd being optional.

- [lowervolume](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/lowervolume)
  \- control sndio to decrease volume by 3 units. Added hooks for `notifyd`.

- [raisevolume](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/raisevolume)
  \- control sndio to increase volume by 3 units. Added hooks for `notifyd`.

- [mutetoggle](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/mutetoggle)
  \- toggle sound muting and for use in multimedia key binding. `Notifyd` informs the user of the event.

- [power-mode](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/power-mode)
  \- toggle to switch between automatic and manual performance adjustment mode.

- [screenoff](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/screenoff)
  \- turn off screen display using X utility.

- [switch-sound-device](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/switch-sound-device)
  \- toggle between built-in and alternate sound devices. This, if you have external sound device connected (e.g. USB speaker)

- [vol](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/vol)
  \- set sndio volume via `vol <num>` where `num` is a number between 0-100

### Optional:

- [libreoffice-calc](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/libreoffice-calc)

- [libreoffice-writer](https://github.com/cyril2day/OpenBSD-Environment/blob/master/scripts/local_bin/libreoffice-writer)
