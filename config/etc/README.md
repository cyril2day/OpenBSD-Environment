#### System configuration files:

- apm

  - [suspend](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/apm/suspend)
    \- lock screen automatically when lid is closed.

- hotplug

  - [attach](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hotplug/attach)
    \- script to execute when device is attached.

  - [detach](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hotplug/detach)
    \- script to execute when device is detached.

- X11/xenodm

  - [Xresources](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/X11/xenodm/Xresources)
    \- sets xenodm login background to black.

  - [Xsetup_0](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/X11/xenodm/Xsetup_0)
    \- sets login window background to black and text font style to `Hermit`.

- [dhclient.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/dhclient.conf)
  \- edit to your desired nameserver. Default is 8.8.8.8 (primary), 208.67.222.222 (secondary).

- [doas.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/doas.conf)
  \- configure so that normal users can run commands with elevated privileges. This is a `sudo` equivalent.

- [fstab](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/fstab)
  \- add `softdep` and `noatime` options for local partitions to improve disk performance. Good for laptops.

- [hosts](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hosts)
  \- I find it useful to explicitly state the IP address of my chosen `installurl`. Without it, for unknown
  reason, installs in `pkg_add` tend to timeout a lot. I might be wrong, of course.

- [login.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/login.conf)
  \- under the file's `staff` login class, we'll increase resource limits for a smoother experience on running
  modern applications like `Chromium`.

- [rc.conf.local](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/rc.conf.local)
  \- run system daemons you need. You can ignore this file and create your own.

- [sysctl.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/sysctl.conf)
  \- set some kernel state for desktop use. My laptop has 16GB of RAM, so scale values accordingly.

- [wsconsctl.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/wsconsctl.conf)
  \- set brightness and disable been when logged into the virtual console.

#### If you want to aggregate multiple network interfaces under trunk(4):

1. [hostname.\[iwm0\]](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hostname.iwm0)
   \- replace `iwm0` with your machine's appropriate wireless interface and set network credentials.

2. [hostname.\[re0\]](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hostname.re0)
   \- replace `re0` with your machine's appropriate ethernet interface.

3. [hostname.trunk0](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hostname.trunk0)
   \- aggregates listed interfaces and implements DHCP

4. [hostname.urndis0](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/hostname.urndis0)
   \- create only if you are teethering with an Android phone.

#### Optional configs:

- [php-7.3.ini](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/php-7.3.ini)

- [php-fpm.conf](https://github.com/cyril2day/OpenBSD-Environment/blob/master/config/etc/php-fpm.conf)
