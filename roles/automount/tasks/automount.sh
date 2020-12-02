#!/nin/bash

#### disable usb and auto-mount
sudo touch /etc/udev/rules.d/85-no-automount.rules

echo 'SUBSYSTEM=="usb", ENV{UDISKS_AUTO}="0"' | sudo tee -a /etc/udev/rules.d/85-no-automount.rules

service udev restart