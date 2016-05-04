#!/bin/bash

# check sudo
if [ `whoami` == "root" ]; then
    # clear old bandwith rules
    dnctl -f flush
    pfctl -q -f /etc/pf.conf
fi
