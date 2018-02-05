# Jean-Marc’s dotfiles

# Mission Statement

- Dotfiles must be self-contained. Installation must only require to clone this repository and run a script.
- Scripts must be indempotent.
- Updated scripts must be able to run only the new and modified parts.

# Readme 

Here are my dotfiles. They are organized around topic areas that I call modules.

Each module is self contained and can be managed independently with the exception of the `homebrew` module which is always run first because it  provides tools used by other modules.

Some files have a special purpose:

* `<MODULE>/install.sh` installs and configures a module.
* `<MODULE>/uninstall.sh` uninstalls a module.
* `<MODULE>/update.sh` updates a module.
* `<MODULE>/aliases.zsh` defines ZSH aliases.
* `<MODULE>/path.zsh` tweaks `$PATH`.

For your convenience, there are some shortcuts to manage all modules:

* `make install`
* `make update`
* `make uninstall`

## Installation

* Clone the repository: `git clone git@github.com:jmfontaine/dotfiles.git ~/.dotfiles`
* Install dotfiles: `~/.dotfiles/install.sh`
* Reload ZSH configuration: `source ~/.zshrc`

You will need to install a [Powerline-patched font](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-2-install-powerline-fonts) for the ZSH theme to render correctly.

If you need to define confidential data in ZSH such as authentication tokens, you can copy the `zsh/secrets.zsh.dist` file as `zsh/secrets.zsh` and add your secrets there. This file is ignored by Git so your secrets won't be commited.

## Feedback

Please report suggestions and improvements to https://github.com/jmfontaine/dotfiles/issues.

## Author

These dotfiles have be put together and polished by Jean-Marc Fontaine with inspiration from the following people:

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Matt Stauffer](https://github.com/mattstauffer/ohmyzsh-dotfiles)
* [Isaac Wolkerstorfer](https://gist.github.com/agnoster/3712874)
* [Wade Simmons](https://github.com/wadey/dotfiles)
* [Zach Holman](https://github.com/holman/dotfiles)
