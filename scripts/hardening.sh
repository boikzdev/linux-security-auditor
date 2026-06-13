#!/bin/bash


APPLY=false


if [[ $1 == "--apply" ]]; then
APPLY=true
fi


echo "Linux Hardening Recommendations"
echo "==============================="


echo "
[+] Disable root SSH login

Edit:
/etc/ssh/sshd_config

Set:

PermitRootLogin no
"



echo "
[+] Enable firewall

sudo ufw enable
"



echo "
[+] Update packages

sudo apt update && sudo apt upgrade
"



if $APPLY
then


echo "[+] Applying safe hardening"


sed -i \
's/^PermitRootLogin.*/PermitRootLogin no/' \
/etc/ssh/sshd_config


systemctl restart ssh


ufw enable


fi
