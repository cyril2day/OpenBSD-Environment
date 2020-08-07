# OpenBSD-Environment

#### Simplistic i3 WM on top of Xfce session.

![OpenBSD environment slideshow](https://github.com/cyril2day/OpenBSD-Environment/blob/master/res/cover/preview.gif)

## Description

These are personal desktop configurations and files in **[OpenBSD](https://openbsd.org)**.
It is assumed herein that guests have prior knowledge to or were already familiar with unix-like systems.

Some scripts are specific to the said OS. Aesthetics, however, may be reproducible in other OS/Linux distro.

## Requisites

- OS: `OpenBSD`
- Session: `xfce4-session`
- Window Manager: `i3`
- Status Bar: `i3status`
- Display Manager: `xenodm`
- App Launcher: `rofi`
- Color Scheme: `Purify`
- Fonts:
  - various fonts imported from `Mac & Windows`
  - `Hermit` for title & status bars
  - `San Francisco Pro Ultralight` or `Segoe UI` as default
  - `San Francisco Mono Regular` as default monospace

## Before you start

Your might encounter trouble on some attempts especially if you install `Thunar`. When `xfce-session` initializes,
it will always try to start `xfce4-panel`. You can build `Thunar` and remove the panel as dependency. Otherwise,
the panel will be included when you install it via `pkg_add`.

As a workaround, navigate to Xfce settings manager and create a session wherein the value of `xfce4-panel`'s _Restart Style_ is _Never_.
If you can see the panel in the Application Autostart, disable or remove it from the entry. Changes will take effect on next login.

You can use my config in `$HOME/.config/xfce4` & `$HOME/.config/autostart` and you should be fine.

## Copyright and license

Copyright 2020 psi <cy.lonsido@gmail.com>. Code is released under [the MIT License](https://github.com/cyril2day/OpenBSD-Environment/blob/master/LICENSE)

## Credits and other references

[Installing OpenBSD on your laptop is really hard(not)](https://sohcahtoa.org.uk/openbsd.html)

[OpenBSD on a Laptop](https://www.c0ffee.net/blog/openbsd-on-a-laptop/)
\- A guide to a secure and streamlined installation of OpenBSD 6.4 on a laptop.

[trash-cli](https://github.com/andreafrancia/trash-cli.git)
\- Command line interface to Freedesktop.org
