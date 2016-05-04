#!/bin/bash
# check sudo
sudo -v

# clear old bandwith rules
sudo dnctl -f flush
sudo pfctl -q -f /etc/pf.conf
