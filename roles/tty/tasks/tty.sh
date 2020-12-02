#!/bin/bash

#### Secure tty use sed to edit comment in securetty
sudo sed -i 's/^\(tty.*\)/#\1/g' /etc/securetty

sudo sed -i '/\btty1\b/s/^#//' /etc/securetty

#chnage ownership of tty file
sudo chown root:root /etc/securetty
sudo chmod 0600 /etc/securetty