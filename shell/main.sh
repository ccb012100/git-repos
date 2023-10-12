#!/usr/bin/env bash
set -eou pipefail

script_dir=$(dirname -- "$(readlink -f -- "$0")")
# FIXME: only runs pull.sh
echo -e "$script_dir/fetch.sh" "$script_dir/pull.sh" | xargs bash -c