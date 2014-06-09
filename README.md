# Jean-Marc’s dotfiles

## Installation

* Install [homesick](https://github.com/technicalpickles/homesick)
* Clone "dotfiles" castle:
```bash
homesick clone jmfontaine/dotfiles
```
* Install "dotfiles" castle:
```bash
homesick symlink dotfiles
```
* Reload ZSH configuration:
```bash
source .zshrc 
```

### ZSH setup

These dotfiles are meant to be used with ZSH. They may work with Bash but there no garantee.

* Install ZSH:
```bash
brew install zsh
```
* Install Oh My ZSH:
```bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/Tools/oh-my-zsh sh
```

### ZSH Syntax Highlighting 

[ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) highlights shell commands to help reading.

* Clone repository: ``git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/Tools``
* Source the script at the end of ``~/.zshrc``:
```bash
source ~/Tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
* Source ``~/.zshrc`` to take changes into account:
```bash
source ~/.zshrc
```

### Powerline Compatible Font

You will need to install a [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts) for the ZSH theme to render correctly.

## Usage

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
sh ~/.config/jmf/osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
brew bundle ~/.brewfile
```

### Install native apps with Homebrew Cask

You could also install native apps with [Homebrew Cask](https://github.com/phinze/homebrew-cask):

```bash
sh ~/.caskfile
```

### Customize dotfiles

You can easily customize these dotfiles by copying the ``.zsh-extra.template`` to ``~/.zsh-extra`` and adding what you need in it.

Once done reload ZSH configuration:
```bash
source ~/.zshrc
```

## Feedback

Please report suggestions and improvements to https://github.com/jmfontaine/dotfiles/issues.

## Author

These dotfiles have be put together and polished by Jean-Marc Fontaine with inspiration from the following people:

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Matt Stauffer](https://github.com/mattstauffer/ohmyzsh-dotfiles)
* [Isaac Wolkerstorfer](https://gist.github.com/agnoster/3712874)
* [Wade Simmons](https://github.com/wadey/dotfiles)


