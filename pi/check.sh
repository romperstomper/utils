#!/bin/sh

if [ "$(ls -A /mnt/downloads)" ]; then
  mv /mnt/downloads/* /mnt/video &&
  /home/pi/rescan
fi
