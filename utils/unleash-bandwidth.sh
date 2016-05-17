#!/bin/bash

# check sudo
if [ `whoami` == "root" ]; then

    # clear old bandwith rules
    dnctl -f flush
    pfctl -q -f /etc/pf.conf

else

  echo "Failed: run with 'sudo ${0##*/} ${@}'"
  exit 1

fi

