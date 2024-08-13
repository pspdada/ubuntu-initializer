#!/bin/bash
set -e # Exit script immediately on first error.

function includeDependencies() {
    # get the current directory of the script
    current_dir="${BASH_SOURCE%/*}"
    if [[ ! -d "${current_dir}" ]]; then current_dir="$PWD"; fi

    # shellcheck source=./setupLibrary.sh
    source "${current_dir}/setupLibrary.share"
}

function main() {
    includeDependencies

    clear
    echo "Initializing setup..."

    changeRepos # change the repository to Tsinghua mirror

    installCommonPackages # install commonly used packages

    installZsh # install zsh and set as default shell

    appendToRc # append to .*rc

    installNvidiaDriver # install Nvidia driver

    sudo apt-get update -y && sudo apt-get upgrade -y # update and upgrade

    sudo timedatectl set-timezone Asia/Shanghai # setup Timezone

    cleanup
}

main
