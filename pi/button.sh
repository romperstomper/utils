#!/bin/bash
echo "button pressed $(date)" >> /home/gary/buttonlog.txt
if ddcutil getvcp 60 | grep -q "0x11"; then
	DISP="0x0f"
else
	DISP="0x11"
fi
ddcutil setvcp 60 $DISP --display 1
