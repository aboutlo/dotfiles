#!/bin/bash
PORT=8080

# check sudo
sudo -v

# Activate PF
pfctl -E

# Reset dummynet to default config
dnctl -f flush

# Compose an addendum to the default config: creates a new anchor
(cat /etc/pf.conf && echo "dummynet-anchor \"mop\"" && echo "anchor \"mop\"") | pfctl -f -

# Configure the new anchor
echo "dummynet in quick proto tcp from any to any port $PORT pipe 1" | pfctl -a mop -f -

# Create the dummynet queue
dnctl pipe 1 config bw 25Kbit/s

