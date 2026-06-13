#!/bin/bash


LOG="/var/log/auth.log"


echo "{"

echo '"failed_logins":'


grep "Failed password" $LOG 2>/dev/null \
| awk '
{
print $1,$2,$3,$11
}
' \
| head -20 \
| jq -R -s '
split("\n")
'


echo "}"
