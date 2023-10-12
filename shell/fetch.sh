#!/usr/bin/env bash
set -eou pipefail

function fetch_repo() {
    # get the last argument because $0 may or may not have the script name
    repo="${*: -1}"
    echo "running: FETCH $repo"
    git fetch "$repo"
}

# export function so that `fd --exec` can access it
export -f fetch_repo

# fetch every repo in $HOME/src
fd . --type directory "$HOME"/src --exact-depth 1 --exec bash -c 'fetch_repo'

# fetch $HOME/.dotfiles
fetch_repo "$HOME"/.dotfiles
