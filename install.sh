#!/usr/bin/env bash

set -e

readonly ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_dotfiles () {
  echo "› Installing dotfiles"

  for src in $(find -H "$ROOT_DIR" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    local dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

link_file () {
  local src=$1 dst=$2
  local overwrite_all=false backup_all=false skip_all=false
  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then
        skip=true;
      else
        echo "file already exists: $dst, what do you want to do?"
        echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      echo "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      echo "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      echo "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    echo "linked $1 to $2"
  fi
}

# Install Homebrew first
${ROOT_DIR}/homebrew/install.sh

# Install everything else
find ${ROOT_DIR} -mindepth 2 -type f -not -path "${ROOT_DIR}/homebrew/*" -name install.sh -exec sh -c {} \;

# Install dotfiles
install_dotfiles

exit 0
