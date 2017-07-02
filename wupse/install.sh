#!/bin/sh

set -x

systemctl daemon-reload
systemctl enable kubelet 
systemctl restart kubelet
