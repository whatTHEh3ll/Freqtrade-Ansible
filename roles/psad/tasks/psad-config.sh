#!/bin/bash

# configure psad
sudo iptables -A INPUT -j LOG

sudo iptables -A FORWARD -j LOG

cp /etc/psad/psad.conf .

sed -i 's/#.*//;/^\s*$/d' psad.conf 

sed -i "s/_CHANGEME_;/$(hostname);/" psad.conf

sed -i 's/ENABLE_AUTO_IDS             N;/ENABLE_AUTO_IDS             Y;/g' psad.conf

# mv psad.conf file /etc/psad.conf
sudo mv psad.conf /etc/psad/psad.conf  

# change ownership of to root
sudo chown root /etc/psad/psad.conf
sudo chown root:root /etc/psad/psad.conf  

sudo psad --sig-update

sudo systemctl restart psad

#sudo systemctl enable psad  

sudo psad -S