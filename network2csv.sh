#!/bin/bash

# Derpy slow Bash script to scan local network and save to CSV
# *hair flip*

echo "Ughhh... starting network scan... *eye roll*"

# Try to auto detect your subnet like a lazy queen
SUBNET=$(ip route | awk '/src/ {print $1}' | head -n 1)

if [ -z "$SUBNET" ]; then
    echo "Like... I can't even find your subnet... bye."
    exit 1
fi

echo "Um, scanning subnet: $SUBNET ... *yawns*"

# Do the nmap scan and output to XML
sudo nmap -sn "$SUBNET" -oX nmapscan.xml

echo "Like, parsing all that ugly XML into a cute CSV... *deep sigh*"

# Parse the XML and make the CSV
{
echo "IP,Hostname,MAC Address"

xmllint --xpath '//host' nmapscan.xml 2>/dev/null | \
grep -oP 'addr="[\d\.]+"' | sed 's/addr="//;s/"//' > ips.txt

xmllint --xpath '//host' nmapscan.xml 2>/dev/null | \
grep -oP 'name="[^"]+"' | sed 's/name="//;s/"//' > hostnames.txt

xmllint --xpath '//host' nmapscan.xml 2>/dev/null | \
grep -oP 'addr="([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}"' | sed 's/addr="//;s/"//' > macs.txt

# Paste it all together
paste -d ',' ips.txt hostnames.txt macs.txt
} > devices.csv

# Cleanup temp files because... ew
rm -f ips.txt hostnames.txt macs.txt

echo "Done, like, whatever. Check 'devices.csv' and live your best life."
