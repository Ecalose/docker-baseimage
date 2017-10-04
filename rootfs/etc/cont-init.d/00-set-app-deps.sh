#!/usr/bin/with-contenv sh

#
# To make sure the app is started last, make it depends on all user-defined
# services.
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

find /etc/s6/services.d -mindepth 1 -maxdepth 1 -type d -not -name ".*" -not -name "s6-*" -not -name app -exec basename {} ';' | while read SVC
do
    # Avoid making circular dependency.
    [ ! -f /etc/s6/services.d/$SVC/app.dep ] || continue

    # Add dependency.
    touch /etc/s6/services.d/app/$SVC.dep
done

# vim: set ft=sh :