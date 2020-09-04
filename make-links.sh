#!/bin/zsh

function make-link () {
  # 1st argument is source, 2nd is target
  # This function also works if there is a file or dir where the symlink should be
  if [[ -e "$2" ]]; then
    echo -n "$2 exists. Replace? [y,n]"
    read -q && { echo; rm -rf "$2"; ln -Fhisv "$1" "$2" } || { echo; echo "not replaced"}
  else
    ln -Fhisv "$1" "$2"
  fi
}

repository_folder="$(dirname $(realpath $0))"
theme_folder="$HOME/Library/Application Support/abnerworks.Typora/themes"

make-link "$repository_folder/solarized" "$theme_folder/solarized"
make-link "$repository_folder/solarized.css" "$theme_folder/solarized.css"
make-link "$repository_folder/solarized-dark.css" "$theme_folder/solarized-dark.css"
