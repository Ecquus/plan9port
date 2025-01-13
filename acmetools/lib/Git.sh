#!/bin/bash -eu

SCRIPT_DIR="$(readlink --canonicalize-existing $(dirname $0))"
REPO_DIR="$(cd "${SCRIPT_DIR}" && git rev-parse --show-toplevel)"
source "${REPO_DIR}/acmetools/lib/Common.sh"

WINDOW_NAME="$(git rev-parse --show-toplevel)/+Git"

# [[ "${BASH_SOURCE[0]}" != "${0}" ]] && abort "This script can only be sourced!"

function prepare_window() {
    Open -n -u "${WINDOW_NAME}"
    tag="$(Read tag $(Getids ${WINDOW_NAME}))"
    git_utils="$(ls "${SCRIPT_DIR}"/Git.* | xargs -I{} basename {} | sed -z 's/\n/ /g')"
    grep -E -q "Git\..*" <<< "${tag}" || Write tag "${git_utils[@]}" "${WINDOW_NAME}"
}
