#!/bin/bash

#### disable shared memory /etc/fstab
echo "#secure shared memory" | sudo tee -a /etc/fstab
echo -e 'tmpfs     /run/shm    tmpfs	defaults,noexec,nosuid 0	0' | sudo tee -a /etc/fstab 