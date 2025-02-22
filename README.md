# Dotfiles

My dotfiles and Mac setup, managed with [chezmoi](https://www.chezmoi.io/).

## Steps

Follow these steps to bootstrap a Mac:

- [Set the computer name](https://support.apple.com/guide/mac-help/change-computers-local-hostname-mac-mchlp2322/mac).
- Install Bitdefender
  - Go to [Bitdefender Central](https://central.bitdefender.com/).
  - [Share the credentials via a 1Password link from another device](https://support.1password.com/share-items/?mac#share-in-the-1password-apps).
  - Log in.
  - Register the device.
- Bootstrap the computer:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmfontaine/dotfiles/master/install.sh)"
```
