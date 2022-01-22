#!/bin/ash
set -e

ulimit -n 65335

exec "$@"
