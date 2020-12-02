#!/bin/bash
# timedatectl set-timezone 'America/Los_Angeles'
# Backup mysql/mariadb database
 
## Get current date ##
_now=$(date +"%m_%d_%Y_%r")
 
## Appending a current date from a $_now to a filename stored in $_file ##
_file="security_$_now.txt"
 
## Do it ##
echo "CHECK UNATTENDED UPGRADES" > "$_file"
echo . >> "$_file"
sudo unattended-upgrades --dry-run --debug >> "$_file"
echo . >> "$_file"
echo "#### PSAD SCAN ####" >> "$_file"
echo . >> "$_file"
psad -S >> "$_file"
echo . >> "$_file"
echo "#### CHECK IF UNWANTED USERS ARE LOGGED IN ####" >> "$_file"
echo . >> "$_file"
cat /etc/passwd | egrep -v '\/false|\/nologin|\/shutdown|\/halt' | cut -d':' -f 1,7 >> "$_file"
echo . >> "$_file"
echo "#### CHECK FOR DDOS ####" >> "$_file"
echo . >> "$_file"
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n >> "$_file"
echo . >> "$_file"
echo "### LOGWATCH RESULTS ###" >> "$_file"
logwatch | less
echo . >> "$_file"
echo "### RUN AUDITD ###" >> "$_file"
aureport >> "$_file"
echo . >> "$_file"
echo "### RUN TIGER ###" >> "$_file"
tiger >> "$_file"



