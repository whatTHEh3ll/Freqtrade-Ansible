#!/bin/bash

echo "ENABLED=0" | sudo tee -a /etc/default/irqbalance
service irqbalance stop