#!/bin/sh

set -x

echo "/opt/cuda/current/lib64" > /etc/ld.so.conf.d/cuda.conf 
ldconfig

