#!/bin/bash

# Usage sudo ./limit-bandwidth 8080 25Kbit/s

PORT=$1
LIMIT=$2
${PORT:=8080}
${LIMIT:='25Kbit/s'}

# check sudo
if [ `whoami` == "root" ]; then

    # Activate PF
    pfctl -E

    # Reset dummynet to default config
    dnctl -f flush

    # Compose an addendum to the default config: creates a new anchori
    (cat /etc/pf.conf && echo "dummynet-anchor \"mop\"" && echo "anchor \"mop\"") | pfctl -f -

    # Configure the new anchor
    echo "dummynet in quick proto tcp from any to any port $PORT pipe 1" | pfctl -a mop -f -

    # Create the dummynet queue
    dnctl pipe 1 config bw $LIMIT

    echo "Limited port $PORT to $LIMIT"

else

  echo "Failed: run with 'sudo ${0##*/} ${@}'"
  exit 1

fi
