#!/bin/sh

set -x

cp /install.sh /rootfs/tmp/install.sh
cp -R /installer/* /rootfs/etc/

chroot /rootfs /tmp/install.sh


