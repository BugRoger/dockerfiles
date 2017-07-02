#!/bin/sh

set -x

mkdir -p /rootfs/opt/nvidia/.work
cp -R /nvidia /rootfs/opt

chroot /rootfs /opt/nvidia/$DRIVER_VERSION/$COREOS_VERSION/bin/nvidia-install.sh 


