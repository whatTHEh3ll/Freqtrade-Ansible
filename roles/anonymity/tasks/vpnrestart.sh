!/bin/bash
# Desc: Ping a nameserver and if failed, restart the VPN service
# File: nano /etc/openvpn/checkopenvpn.sh
# chmod +x /etc/openvpn/checkopenvpn.sh
# crontab -e
# Add this line to check every five minutes
#    */5 * * * * /etc/openvpn/checkopenvpn.sh >> /var/log/checkopenvpn.log 2>&1
# See cron logs
# grep -i cron /var/log/syslog
# Copyright Eric Draken, 2019
 
# CloudFlare nameserver
IP=1.1.1.1
RESULT=$(ping -c 8 -W 2 $IP | grep received | awk '{print $4}')
if [ $RESULT -eq 0 ]; then
    echo "OpenVPN tunnel failed"
 
    # Check if the OpenVPN daemon is running
    ps aux | grep [o]penvpn > /dev/null 2>&1
    if [ $? -eq 0 ]; then
 
        # Restart the VPN service if it is already started
        systemctl restart openvpn
 
        if [ $? -eq 0 ]; then
            echo "$(date) - OpenVPN restarted"
        else
            echo "$(date) - OpenVPN restart failed. See logs"
        fi
    fi
fi
 
# REF: https://forum.htpcguides.com/Thread-Monitor-linux-openvpn-daemon-and-restart-if-disconnected
