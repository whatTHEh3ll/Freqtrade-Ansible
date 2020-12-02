#!/bin/bash

sudo dd if=/dev/zero of=/usr/tmpDSK bs=1024 count=1024000

sudo cp -Rpfv /tmp /tmpbackup

sudo mount -t tmpfs -o loop,noexec,nosuid,rw /usr/tmpDSK /tmp

sudo chmod 1777 /tmp

sudo cp -Rpf /tmpbackup/* /tmp/

sudo rm -rf /tmpbackup/*

echo '#secure the tmp directory' | sudo tee -a /etc/fstab 

echo '/usr/tmpDSK /tmp tmpfs loop,nosuid,noexec,rw 0 0' | sudo tee -a /etc/fstab 

sudo mv /var/tmp /var/tmpold

sudo ln -s /tmp /var/tmp

sudo cp -prfv /var/tmpold/* /tmp/