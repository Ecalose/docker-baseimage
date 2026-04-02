#!/bin/sh
#
# Clean the /tmp directory.
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

find /tmp -mindepth 1 -maxdepth 1 ! -name '.cont-env-internal' -exec rm -rf {} +

# vim:ft=sh:ts=4:sw=4:et:sts=4
