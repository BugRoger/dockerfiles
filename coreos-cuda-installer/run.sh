#!/bin/sh

set -x

cp -R /opt/cuda /rootfs/opt/
cp  /install.sh /rootfs/tmp/

chroot /rootfs /tmp/install.sh
