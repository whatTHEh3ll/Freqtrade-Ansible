#!/bin/bash

#### remove unneccasary packages

# disable apport
apt-get purge apport -y

# remove mailutils
apt-get purge mailutils -y

# disable at
apt-get purge at -y

# disable avahi-daemon
apt-get remove avahi-daemon avahi-utils -y

# disable cups
apt-get remove cups -y

# disable dovecot
apt-get purge dovecot-* -y

# disable NFS
apt-get purge nfs-kernel-server nfs-common portmap rpcbind autofs -y

# disable SNMP 
apt-get purge --auto-remove snmp -y

# disable Telnet
apt-get purge telnetd inetutils-telnetd telnetd-ssl -y

# disable whoopsie
apt-get purge whoopsie -y

# disable zeitgeist
apt-get purge zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist -y

# autoremove
apt-get autoremove -y 

# autoclean
apt-get autoclean -y
