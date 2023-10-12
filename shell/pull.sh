#!/usr/bin/env bash
set -eou pipefail

function pull_repo() {
    # get the last argument because $0 may or may not have the script name
    repo="${*: -1}"
    echo "running: PULL $repo"
    cd "$repo" && git pull
}

# export function so that `fd --exec` can access it
export -f pull_repo

# pull every repo in $HOME/tools
fd . --type directory "$HOME"/tools --exact-depth 1 --exec bash -c 'pull_repo'
