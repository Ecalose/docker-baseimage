#!/bin/sh
#
# Setup variable data files directories.
# https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html#vartmpTemporaryFilesPreservedBetwee
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

#
# The `/var/run` directory contains system information data describing the
# system since it was booted.
#
# `/var/run` -> `/run` -> `/tmp/run`.
#
mkdir -p /tmp/run
chmod 755 /tmp/run

#
# The `/var/tmp` directory is made available for programs that require temporary
# files or directories that are preserved between system reboots.
#
# `/var/tmp` -> `/config/var/tmp`
#
VAR_TMP_DIR="/config/var/tmp"
mkdir -p "${VAR_TMP_DIR}"
chmod 777 "${VAR_TMP_DIR}"
chmod +t "${VAR_TMP_DIR}" || true

#
# The `/var/log` directory contains miscellaneous log files.
#
# `/var/log` -> /config/log
#
mkdir -p /config/log
