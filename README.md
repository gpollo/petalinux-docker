# Petalinux Docker Images

Petalinux tools are tricky to get working on a unsupported system (such as Archlinux).
You can use these scripts to create Docker images with Petalinux and run them easily.

## Requirements

Petalinux has special licenses. We're not allowed to redistribute it how we want. Before
using this repository, you need to download the appropriate Petalinux installer from
[here](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html).
Then, place the installer in the appropriate directory (e.g. `2021.1/files/`). You can
double-check the checksum of the file in the `checksums.txt` file in the same directory.

## Usage

You can execute the `run.sh` script to build an image and run it. The resulting container
will be run in privileged mode with the current directory mounted.

```
$ path/to/run.sh <VERSION>
```

## Example

In the container, make sure to source `/petalinux/settings.sh` to load Petalinux tools.

```bash
(host) $ path/to/this/run.sh 2022.1
(container) $ source /petalinux/settings.sh
```
