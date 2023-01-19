#!/usr/bin/env bash

read -d '' TERMINAL_MESSAGE << EOF

-------------------------------------------------
Smartd has detected an error!

Error type: $SMARTD_FAILTYPE
Device node: $SMARTD_DEVICESTRING
Date occurred: $SMARTD_TFIRST
-------------------------------------------------

EOF

for pts in /dev/pts/*; do
  echo "$TERMINAL_MESSAGE" > $pts
done
