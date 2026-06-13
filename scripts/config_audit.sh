#!/bin/bash


echo "{"

echo '"hostname": "'$(hostname)'",'


echo '"kernel": "'$(uname -r)'",'


echo '"checks": ['


FAIL=0


# SSH root login

SSH_ROOT=$(grep "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null)


if [[ "$SSH_ROOT" == *yes* ]]; then

echo '{
"severity":"HIGH",
"issue":"SSH root login enabled",
"fix":"Disable PermitRootLogin"
},'

FAIL=1

fi



# Firewall

if command -v ufw >/dev/null; then


STATUS=$(ufw status | grep active)


if [ -z "$STATUS" ]; then


echo '
{
"severity":"MEDIUM",
"issue":"Firewall disabled",
"fix":"Enable ufw"
},'


fi

fi



# World writable files


WW=$(find / -xdev -type f -perm -002 2>/dev/null | head)


if [ ! -z "$WW" ]; then


echo '
{
"severity":"MEDIUM",
"issue":"World writable files found",
"fix":"Restrict permissions"
},'


fi



echo '{}'

echo "]"

echo "}"
