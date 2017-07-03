#!/bin/sh

set -x

cp /installer/install.sh /rootfs/tmp/install.sh
cp -R /installer/etc /rootfs/
cp -R /installer/opt /rootfs/

chroot /rootfs /tmp/install.sh

rm /rootfs/tmp/install.sh
