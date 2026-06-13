#!/bin/bash


echo "{"

echo '"open_ports":'


if command -v nmap >/dev/null; then


nmap -sV localhost \
-oG - \
| grep open \
| awk '{print $2,$3,$4}' \
| jq -R -s '
split("\n")
'


else


ss -tuln \
| awk '{print $5}' \
| jq -R -s '
split("\n")
'


fi


echo "}"
