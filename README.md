## Initial setup script for Ubuntu

This is a setup script to automate the setup and provisioning of Ubuntu servers. It does the following:

- Change default repository to Tsinghua Ubuntu Mirror
- Setup the timezone for the server (Default to "Asia/Jakarta")
- Update and upgrade server for first time

## Installation

SSH into your server and install git if it is not installed:

```bash
sudo apt-get update
sudo apt-get install git
```

Clone this repository into your home directory:

```bash
cd ~
git clone https://github.com/pspdada/ubuntu-initializer.git
```

Run the setup script

```bash
cd ubuntu-initializer
./setup.sh
```

## Different Line Endings

Windows/MS-DOS text files use a pair of characters, carriage return (CR or \r) and line feed (LF or \n), as their line endings, whereas Unix text files use only the line feed (LF) character. Therefore, for files created on a Windows system that have been copied to a Linux system for some reason, the format needs to be converted. You can use the following command:

```bash
dos2unix ./setup.sh
```

For reference: https://github.com/koalaman/shellcheck/wiki/SC1017

## Supported versions

This setup script is designed for Ubuntu 24.04.

This setup script won't work on the version before Ubuntu 24.04 since before Ubuntu 24.04, the software source configuration file for Ubuntu used the traditional One-Line-Style, located at `/etc/apt/sources.list`; starting from Ubuntu 24.04, the software source configuration file changed to the DEB822 format, located at `/etc/apt/sources.list.d/ubuntu.sources`.

## Acknowledgments

The `.vimrc` file was copied from https://github.com/missing-semester/missing-semester.
